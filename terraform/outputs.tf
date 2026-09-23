output "alb_dns_name" {
  description = "Public URL of the load balancer — this is your app's live address"
  value       = aws_lb.main.dns_name
}

output "jenkins_public_ip" {
  description = "Public IP of the Jenkins server"
  value       = aws_eip.jenkins.public_ip
}

output "ecr_backend_repository_url" {
  description = "ECR repository URL for the backend image"
  value       = aws_ecr_repository.backend.repository_url
}

output "ecr_frontend_repository_url" {
  description = "ECR repository URL for the frontend image"
  value       = aws_ecr_repository.frontend.repository_url
}

output "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  value       = aws_ecs_cluster.main.name
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}