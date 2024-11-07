variable "vpc_aws_az" {
  type        = list(string)
  default     = ["us-east-1a"]
  description = "Variable para la AZ"
}
variable "vpc_cidr" {
  type        = string
  description = "Variable para CIDR"
}
variable "private_subnet" {
  type        = list(string)
  description = "Variable de Subnet"
}
variable "ami" {
  type        = string
  description = "Variable para la AMI"
}
variable "instance-type" {
  type        = string
  description = "Variable tipo de instancia"
}
variable "key" {
  type        = string
  description = "Variable para Key"
}
variable "path_key" {
  type = string
  description = "Path de Key"
}