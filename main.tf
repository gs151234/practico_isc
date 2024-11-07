module "deploy-instance" {
  source         = "D:\\Terraform\\Practico3\\modules\\custom-deploy"
  vpc_aws_az     = var.vpc_aws_az
  vpc_cidr       = var.vpc_cidr
  private_subnet = var.private_subnet
  ami            = var.ami
  instance-type  = var.instance-type
  key            = var.key
  path_key       = var.path_key
}
output "ec2-instance-id" {
  value = module.deploy-instance.ec2-instance-id
}

output "ec2-instance-dns" {
  value = module.deploy-instance.ec2-instance-dns
}