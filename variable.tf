# variable "my_instance_type" {
#   type        = string
#   description = "My instance type"
# }

# variable "environment_name" {
#   type        = string
#   description = "Evironment"

# }

# variable "instance_tags" {
#   type = object({
#     name = string
#     foo  = number
#   })

# }

# variable "foobar" {
#   type = list(number)

# }

variable "AWS_REGIONS" {
  default = "eu-west-1"

}
# variable "AMIS" {
#   type = map(string)
#   default = {
#     us-east-1 = "ami-04505e74c0741db8d"
#     us-west-2 = "ami-0892d3c7ee96c0bf7"
#     eu-west-1 = "ami-08ca3fed11864d6bb"
#   }

# }

# variable "PATH_TO_PRIVATE_KEY" {
#   default = "mykey"
# }

# variable "PATH_TO_PUBLIC_KEY" {
#   default = "mykey.pub"

# }
# variable "INSTANCE_USERNAME" {
#   default = "ubuntu"
# }

# variable "max_ingress_rules" {
#   default = 60

# }

variable "path_source_code" {
  default = "lambda_function"
}
variable "function_name" {
  default = "main"
}
variable "runtime" {
  default = "python3.7"
}

variable "handler" {
  default = "lambda_function.lambda_handler"
}
