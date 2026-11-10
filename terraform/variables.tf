variable "project_name" {
  description = "Name prefix applied to all resources"
  type        = string
  default     = "fullstack-ecs-app"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the two public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the two private subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "my_ip" {
  description = "Your IP address in CIDR form, e.g. 203.0.113.5/32 — restricts SSH/Jenkins access to just you"
  type        = string
}

variable "backend_cpu" {
  description = "CPU units for the backend task (1024 = 1 vCPU)"
  type        = number
  default     = 256
}

variable "backend_memory" {
  description = "Memory (MB) for the backend task"
  type        = number
  default     = 512
}

variable "frontend_cpu" {
  description = "CPU units for the frontend task (1024 = 1 vCPU)"
  type        = number
  default     = 256
}

variable "frontend_memory" {
  description = "Memory (MB) for the frontend task"
  type        = number
  default     = 512
}

variable "desired_count" {
  description = "Number of task copies to run per service, to start"
  type        = number
  default     = 1
}

variable "key_pair_name" {
  description = "Name of an existing EC2 key pair, used to SSH into the Jenkins server"
  type        = string
  default     = "AndreD_Key"
}