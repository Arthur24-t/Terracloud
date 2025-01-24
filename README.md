# Comparison between IaaS and PaaS on Azure Cloud with Automation via Terraform

## Project Description
This project aims to compare an Infrastructure-as-a-Service (IaaS) solution with a Platform-as-a-Service (PaaS) solution within the Azure Cloud environment. The objective is to measure and analyze differences in performance, cost, scalability, flexibility, and management complexity. To ensure reproducibility and automation, the deployment of infrastructure is carried out using Terraform.

## Project Objectives
- Compare the performance of IaaS and PaaS solutions.
- Assess the costs associated with both approaches.
- Analyze ease of use and management complexity.
- Measure scalability and deployment times.
- Automate the entire process to ensure full reproducibility.

## Environment and Technologies
- **Cloud Provider**: Microsoft Azure
- **Automation Tool**: Terraform
- **IaaS Solution**: Azure Virtual Machines
- **PaaS Solution**: Azure App Service
- **Languages**: HCL (HashiCorp Configuration Language) for Terraform
- **Monitoring**: Azure Monitor for performance and logs

## Project Architecture
### IaaS Solution
1. Creation of a virtual machine using Terraform.
2. Configuration of associated resources:
   - Virtual Network (VNet)
   - Network Security Group (NSG)
   - Storage Disk
3. Deployment of a basic web application on the VM.

### PaaS Solution
1. Creation of an Azure App Service using Terraform.
2. Deployment of the same web application on the service.

### Application Deployment
The project includes the deployment of the "Voting App" example, which consists of the following components:
- **Poll Service**: Frontend for users to cast votes.
- **Result Service**: Frontend to display voting results.
- **Worker Service**: Background service to process votes.
- **Redis**: In-memory data store for caching and message brokering.
- **PostgreSQL**: Relational database for persistent data storage.

## Comparison and Evaluation Criteria
1. **Performance**: Latency, response time, and maximum load supported.
2. **Costs**: Estimated monthly costs for both solutions.
3. **Management Complexity**: Effort required for configuration, deployment, and maintenance.
4. **Flexibility**: Ability to adapt resources to application needs.
5. **Scalability**: Time and effort to scale up resources.

## File Structure
```
.
├── iaas
│   ├── interface.tf
│   ├── network.tf
│   ├── main.tf
│   ├── providers.tf
│   ├── outputs.tf
│   ├── variables.tf
├── paas
│   ├── aks.tf
│   ├── app_deployement.tf
│   ├── app_service.tf
│   ├── providers.tf
│   ├── variables.tf
├── scripts
│   ├── stress_test.js
├── README.md
```
- **main.tf**: Main entry point for Terraform.
- **variables.tf**: Global variables for the project.
- **outputs.tf**: Terraform output definitions.
- **iaas/**: IaaS resource configurations.
- **paas/**: PaaS resource configurations.
- **scripts/**: Scripts for application deployment.

## Prerequisites
- Azure account with an active subscription.
- Terraform installed (version 1.5.0 or higher).
- Azure CLI configured.
- Access to a local machine to run Terraform.

## Installation and Usage Instructions
1. **Clone the project repository**
   ```bash
   git clone <REPOSITORY_URL>
   cd <REPOSITORY_NAME>
   ```

2. **Configure Terraform variables**
   Modify the `variables.tf` file to add your Azure information (subscription ID, location, etc.).

3. **Initialize Terraform**
   ```bash
   terraform init
   ```

4. **Apply the configuration for each solution**
   - For IaaS:
     ```bash
     terraform apply -var-file=iaas/iaas.tfvars
     ```
   - For PaaS:
     ```bash
     terraform apply -var-file=paas/paas.tfvars
     ```

5. **Analyze the results**
   Collect performance and cost data using Azure Monitor and compare both solutions.

## Deliverables
- Terraform scripts for IaaS and PaaS deployments.
- Comparative analysis report.
- Complete documentation (this README).

## Expected Outcome
This project will determine the advantages and disadvantages of IaaS and PaaS solutions for a typical web application. The final choice will depend on project priorities (performance, cost, ease of use, etc.).

