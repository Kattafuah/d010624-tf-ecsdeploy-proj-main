# d010624-tf-ecsdeploy-proj-main

## Terraform ECS Deployment Project
This repository contains infrastructure as code (IaC) for deploying a containerized application on Amazon Elastic Container Service (ECS) using Terraform. The project includes a GitHub Actions workflow that automates the deployment process and utilizes OpenID Connect (OIDC) to securely manage AWS credentials.

### Overview
This project leverages Terraform to provision an ECS cluster and deploy applications in a robust, scalable environment on AWS. The infrastructure setup includes services like ECS, Elastic Load Balancing (ELB), Virtual Private Cloud (VPC), and security groups to ensure secure and efficient resource management. The infra.yml workflow file in this repository automates the deployment pipeline, simplifying the process of infrastructure provisioning. Terraform state files are securely stored in Amazon S3, and the project follows a modular structure for easy customization and scalability.

### Features
* Automated Infrastructure Deployment: The infra.yml GitHub Actions workflow automates the entire process of deploying the infrastructure.
* OIDC Authentication: Utilizes OIDC to securely manage AWS credentials without needing to store long-term credentials in GitHub secrets.
* Slack Chatbot Integration: Includes a resource for a Slack chatbot to provide deployment status updates and alerts for enhanced monitoring and communication.
* State Management: Terraform state files are stored in an S3 bucket, ensuring centralized, secure, and shared state management.
* Modular Terraform Setup: The project is organized into reusable modules, making it easy to extend, maintain, and customize.
* Scalable Architecture: Leverages ECS with Fargate (or EC2) for auto-scaling to handle varying loads.
* High Availability: Configured across multiple availability zones for resilience.
* Secure Access: Utilizes security groups, IAM roles, and policies to ensure restricted and managed access.
* Customizable: Easily configurable for different environments (development, staging, production) with Terraform variables.

### Prerequisites
* Terraform: Version 0.13 or later
* AWS CLI: Configured with the necessary permissions to provision resources
* Git: To clone the repository
* GitHub Repository with Actions Enabled: To run the infra.yml workflow

### Infrastructure Diagram
[Optional: Include a diagram of the architecture here, showing ECS cluster, ALB, VPC subnets, security groups, etc.]

### Setup and Deployment
1. Clone the Repository

```
git clone https://github.com/Kattafuah/d010624-tf-ecsdeploy-proj-main.git
cd d010624-tf-ecsdeploy-proj-main
```

2. Configure AWS OIDC Integration

Ensure that your AWS account is set up to trust GitHub's OIDC provider, allowing GitHub Actions to request temporary AWS credentials for deployment.

3. Run the infra.yml Workflow

The workflow file, infra.yml, automates the infrastructure deployment process. Push changes trigger the workflow to initiate the deployment.

4. Monitor Workflow Progress

Check the progress and output of the deployment directly in the GitHub Actions tab of your repository.

### Configuration
The deployment can be customized by modifying variables in the variables.tf file:

* region: AWS region to deploy resources (default: us-east-1)
* app_name: Name of the application
* instance_type: ECS instance type (if using EC2 launch type)
* desired_count: Desired number of ECS service instances

### Accessing the Application
After successful deployment, the application should be accessible through the DNS of the Application Load Balancer (ALB). To retrieve the ALB URL:


```terraform output alb_dns_name```

### Cleanup
To delete all resources created by this project run:

```terraform destroy```


