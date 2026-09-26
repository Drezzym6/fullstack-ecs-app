
pipeline {
    agent any

    environment {
        AWS_REGION           = 'us-east-1'
        AWS_ACCOUNT_ID       = '730335365330'
        ECR_BACKEND_REPO     = '730335365330.dkr.ecr.us-east-1.amazonaws.com/tech-challenge-1-backend'
        ECR_FRONTEND_REPO    = '730335365330.dkr.ecr.us-east-1.amazonaws.com/tech-challenge-1-frontend'
        ECS_CLUSTER          = 'tech-challenge-1-cluster'
        ECS_BACKEND_SERVICE  = 'tech-challenge-1-backend-service'
        ECS_FRONTEND_SERVICE = 'tech-challenge-1-frontend-service'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Images') {
            steps {
                sh 'docker build -t backend-app ./backend'
                sh 'docker build -t frontend-app ./frontend'
            }
        }

        stage('Login to ECR') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-creds']]) {
                    sh '''
                        aws ecr get-login-password --region $AWS_REGION | \
                        docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
                    '''
                }
            }
        }

        stage('Tag & Push Images') {
            steps {
                sh 'docker tag backend-app:latest $ECR_BACKEND_REPO:latest'
                sh 'docker tag frontend-app:latest $ECR_FRONTEND_REPO:latest'
                sh 'docker push $ECR_BACKEND_REPO:latest'
                sh 'docker push $ECR_FRONTEND_REPO:latest'
            }
        }

        stage('Deploy to ECS') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-creds']]) {
                    sh '''
                        aws ecs update-service --cluster $ECS_CLUSTER --service $ECS_BACKEND_SERVICE --force-new-deployment --region $AWS_REGION
                        aws ecs update-service --cluster $ECS_CLUSTER --service $ECS_FRONTEND_SERVICE --force-new-deployment --region $AWS_REGION
                    '''
                }
            }
        }
    }
}
