# Finds latest Ubuntu AMI version
# aws ec2 describe-images --filters Name=name,Values=ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64* --query 'Images[*].[ImageId,CreationDate]' --output text

data "aws_iam_policy" "AmazonSSMManagedInstanceCore" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

data "aws_iam_policy" "AmazonSSMPatchAssociation" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMPatchAssociation"
}

resource "aws_iam_role" "ssm_role" {
  name                = "PrismaSSMRoleForEC2-${random_string.random.result}"
  managed_policy_arns = [data.aws_iam_policy.AmazonSSMManagedInstanceCore.arn, data.aws_iam_policy.AmazonSSMPatchAssociation.arn]
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_instance_profile" "ssm_profile" {
  name = "ssm_profile-${random_string.random.result}"
  role = aws_iam_role.ssm_role.name
}

# Creates a PEM (and OpenSSH) formatted private key
resource "tls_private_key" "private-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Provides an EC2 key pair resource
resource "aws_key_pair" "generated_key" {
  key_name   = "myKey-${random_string.random.result}"
  public_key = tls_private_key.private-key.public_key_openssh
}

# Use to save the private key to a file when running Terraform on your laptop
# resource "local_sensitive_file" "ssh_key" {
#   content         = tls_private_key.private-key.private_key_pem
#   filename        = "myKey.pem"
#   file_permission = "400"
# }

# Creates a generic Ubuntu server
resource "aws_instance" "server" {
  for_each                    = var.public_instances
  ami                         = each.value[1]
  instance_type               = each.value[0]
  subnet_id                   = aws_subnet.pub_net.id
  vpc_security_group_ids      = [aws_security_group.internet_sg.id]
  key_name                    = aws_key_pair.generated_key.key_name
  iam_instance_profile        = aws_iam_instance_profile.ssm_profile.name
  associate_public_ip_address = true
  monitoring                  = false
  #user_data                   = each.value[2] == "null" ? null : file(each.value[2])
  user_data                   = each.value[2] == "null" ? null : file(each.value[2])

  root_block_device {
    encrypted   = true
    volume_type = "gp3"
    volume_size = 40
  }

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  tags = {
    Name = each.key
    proj = "infra-aws-ec2"
    scan = var.public_instances [each.key][3]
  }

  lifecycle {
    ignore_changes = [ami]
  }
}