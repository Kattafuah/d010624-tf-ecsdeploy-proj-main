## Terraform AWS Infrastructure Deployment Project
This project automates the deployment of a production-grade AWS infrastructure using Terraform. It provisions essential resources such as a Virtual Private Cloud (VPC), Elastic Container Service (ECS), Elastic Container Registry (ECR), Web Application Firewall (WAF), Route 53, Auto Scaling, and an Application Load Balancer (ALB). Additionally, the project includes resources like Slack Chatbot integration, CloudWatch Logs and Log Groups for monitoring and logging, and IAM roles for security management. The infrastructure is managed and deployed through GitHub Actions, which automates the CI/CD pipeline. AWS credentials are securely managed using OpenID Connect (OIDC), ensuring seamless authentication for deploying resources to AWS without the need for manual access keys. This setup provides a scalable, secure, and efficient deployment process for both application infrastructure and monitoring solutions.

### Overview
This project leverages Terraform to automate the deployment of a production-grade AWS infrastructure, encompassing a wide range of critical services including ECS, ECR, VPC, WAF, Auto Scaling, ALB, CloudWatch Logs, IAM, and Route 53. Additionally, a Slack Chatbot integration is provided for real-time communication, ensuring seamless monitoring and updates. The deployment is fully automated using GitHub Actions, with OpenID Connect (OIDC) utilized for secure AWS credentials management. This infrastructure setup is designed for high availability, scalability, and security, while ensuring smooth integration between infrastructure components and applications. The project follows a modular structure for easy customization and scalability.

### Features
* **Production-grade AWS Infrastructure:** Includes modules for VPC setup, ECS clusters for containerized application deployment, ECR for container image storage, ALB for load balancing, Auto Scaling for dynamic resource management, and Route 53 for DNS management.
* **Slack Chatbot Integration:** A Slack chatbot resource that provides real-time communication and updates on the infrastructure and application status.
* **CloudWatch Logs and Log Groups:** Integrated logging using CloudWatch to monitor resources and applications in real-time, providing insight into system health and performance.
* **IAM Roles and Security:** Managed IAM roles for secure access control and resource management across the AWS environment.
* **Web Application Firewall (WAF):** Set up to protect the infrastructure from common web exploits and attacks.
* **Automation with GitHub Actions:** The entire infrastructure is deployed automatically through a GitHub Actions workflow, which ensures continuous integration and continuous deployment (CI/CD) of the resources.
* **OIDC for AWS Credentials:** AWS credentials are securely handled using OpenID Connect (OIDC), allowing seamless authentication for Terraform to provision resources without the need for manual credentials.
* **IAM Roles and Policies:** Managed IAM roles with the principle of least privilege to securely manage access control for AWS resources.

### Prerequisites
* Terraform: Version 0.13 or later
* AWS CLI: Configured with the necessary permissions to provision resources
* Git: To clone the repository
* GitHub Repository with Actions Enabled: To run the infra.yml workflow

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

### Slack Chatbot Integration
This project includes a Slack chatbot resource configured to send notifications and updates regarding the deployment process. This integration enhances communication by allowing teams to stay informed about infrastructure status and potential issues in real-time.

### State Management with S3
The Terraform state files are stored in an Amazon S3 bucket. This ensures that state information is securely stored, accessible to authorized users, and protected against accidental loss. Using S3 also allows for collaboration and state locking when integrated with additional mechanisms like DynamoDB (optional for state locking).

### Modular Structure
The project is organized into a modular Terraform structure to ensure flexibility, reusability, and scalability. Each AWS service component is defined in separate modules or .tf files, allowing for easy updates and management of individual resources. This modular design enables independent scaling, version control, and updates to specific components without disrupting the overall infrastructure. The modular structure includes:

#### Core Modules:
* **VPC Module (tf-vpc):** Contains the main.tf, outputs.tf, vpc-flow-logs.tf and provider.tf files that define the Virtual Private Cloud, subnet configurations.
* **ECS Module (tf-ecs):** This module contains the relevant tf files for other services needed for container deployment.These include: 
    * **waf.tf:** Configures the Web Application Firewall for protecting the application.
    * **iam.tf:** Defines IAM roles and policies for secure access control.
    * **logs.tf:** Configures CloudWatch Logs and Log Groups for centralized logging.
    * **route53.tf:** Sets up DNS management for the application. 
    * **variables.tf:** Defines input variables for the module.
    * **outputs.tf:** Outputs the necessary information for the module.
    * **auto_scaling.tf:** Configures autoscaling for the ECS. 
    * **ecs.tf:** Configures the ECS cluster, task definitions, and services for container deployment.
    * **slack-chatbot.tf**: Manages the deployment of the Slack chatbot resource for real-time notifications.
* **ECR Module (tf-ecr):** This contains the main.tf, outputs.tf, and variables.tf files. They handle the Elastic Container Registry setup for storing container images.

### CI/CD Pipeline
The project utilizes GitHub Actions to automate the entire infrastructure deployment process, implementing a full CI/CD (Continuous Integration/Continuous Deployment) pipeline. The workflow is designed to automatically trigger upon code changes or pushes to the repository, ensuring that the latest infrastructure configurations are deployed to AWS without manual intervention.

* **Automated Deployment:** The GitHub Actions workflow is defined in a YAML file (infra.yml). It manages the entire lifecycle of the infrastructure deployment, from initialization, validation, and planning to applying Terraform configurations and provisioning resources. The automated process ensures that every change to the Terraform code is consistently applied across different environments, reducing the risk of human error and ensuring that the infrastructure remains up to date.

* **OIDC for AWS Credentials:** To securely authenticate with AWS during deployment, the CI/CD pipeline uses OpenID Connect (OIDC) for AWS credentials management. This method avoids the need to store AWS access keys or secrets in the repository. Instead, GitHub Actions authenticates directly to AWS using OIDC, allowing for secure, temporary credentials to be issued based on the identity of the GitHub Action runner. This approach not only improves security by eliminating hardcoded credentials but also simplifies credential management by leveraging GitHub's built-in integrations with AWS.

* **Terraform Automation:** The pipeline ensures that Terraform operations (such as terraform init, terraform plan, and terraform apply) are executed automatically, streamlining the deployment process. With Terraform, infrastructure is treated as code, enabling version control, automated testing, and reusability. The workflow also supports running plan and apply commands conditionally, based on changes to the infrastructure code.

* **Efficiency and Consistency:** By automating the entire deployment process, this CI/CD pipeline enhances the overall efficiency of the infrastructure management process. It ensures that the infrastructure is deployed and managed consistently across all environments, with any changes being tracked and versioned in the GitHub repository. This reduces the time required for manual deployments and ensures reliable and repeatable infrastructure provisioning.

*Note: Ensure your GitHub Actions workflow is configured with the appropriate AWS IAM permissions to enable OpenID Connect (OIDC) authentication. This allows the runner to assume temporary credentials for secure interaction with AWS services.*

### Configuration
The deployment can be customized by modifying variables in the variables.tf file. These include but are not limited to:

* region: AWS region to deploy resources (default: us-east-1)
* app_name: Name of the application
* instance_type: ECS instance type (if using EC2 launch type)
* desired_count: Desired number of ECS service instances

### Accessing the Application
After successful deployment, the application should be accessible through the DNS of the Application Load Balancer (ALB). To retrieve the ALB URL run:

```terraform output alb_dns_name```

### Cleanup
To delete all resources created by this project run:

```terraform destroy```

or change "apply" to "destroy" in line 43 of the infra.yml worflow file, commit and push changes. The resources created will be destroyed.  

## Troubleshooting
- *OIDC Misconfiguration*: Ensure that your AWS account trusts GitHub’s OIDC provider. Double-check your GitHub repository’s OIDC setup in AWS IAM Identity Providers.
- *Terraform State Issues*: If you encounter errors related to the Terraform state file, verify that the S3 bucket for state storage is correctly configured and accessible. Ensure proper access permissions are in place.

