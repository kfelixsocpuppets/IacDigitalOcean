DigitalOcean Terraform Deployment
This project uses Terraform to deploy and manage infrastructure on DigitalOcean.
Prerequisites
Before you begin, ensure you have the following installed:

Terraform (>= 1.0)
DigitalOcean CLI (doctl) (optional, but recommended)
A DigitalOcean account with billing enabled

Getting Your DigitalOcean API Token

Log into your DigitalOcean account at cloud.digitalocean.com
Navigate to API in the left sidebar, or visit cloud.digitalocean.com/account/api/tokens

Click Generate New Token
Give it a name (e.g., "Terraform")
Select Write scope (Terraform needs both read and write permissions)
Click Generate Token
Copy the token immediately - it will only be shown once!

Project Structure
.
├── main.tf                 # Main Terraform configuration
├── variables.tf            # Variable definitions
├── outputs.tf              # Output definitions
├── terraform.tfvars        # Variable values (DO NOT commit to git!)
├── .gitignore             # Git ignore file
└── README.md              # This file
Setup Instructions
1. Clone the Repository
bashgit clone <your-repo-url>
cd <your-repo-name>
2. Configure Your API Token
Option A: Using Environment Variable (Recommended)
bashexport TF_VAR_do_token="your_digitalocean_token_here"
To make it permanent, add to your ~/.bashrc or ~/.zshrc:
bashecho 'export TF_VAR_do_token="your_token_here"' >> ~/.bashrc
source ~/.bashrc
Option B: Using terraform.tfvars File
Create a terraform.tfvars file (this file is gitignored):
hcldo_token = "your_digitalocean_token_here"
3. Initialize Terraform
bashterraform init
This downloads the DigitalOcean provider and initializes your workspace.
4. Review the Plan
bashterraform plan
This shows you what resources will be created without actually creating them.
5. Apply the Configuration
bashterraform apply
Type yes when prompted to confirm the deployment.
What Gets Deployed
This Terraform configuration deploys:

2 Droplets in different datacenters (NYC2 and SFO3)
Ubuntu 24.04 LTS operating system
s-1vcpu-1gb size (1 vCPU, 1GB RAM, 25GB SSD) - $6/month per droplet
Tagged for easy management

Available DigitalOcean Regions
Region CodeLocationnyc1New York 1nyc2New York 2nyc3New York 3sfo2San Francisco 2sfo3San Francisco 3tor1Toronto 1lon1London 1fra1Frankfurt 1ams2Amsterdam 2ams3Amsterdam 3sgp1Singapore 1blr1Bangalore 1
Common Droplet Sizes
Size SlugvCPUsRAMSSDPrice/Months-1vcpu-1gb11GB25GB$6s-1vcpu-2gb12GB50GB$12s-2vcpu-2gb22GB60GB$18s-2vcpu-4gb24GB80GB$24s-4vcpu-8gb48GB160GB$48
Customization
Change Regions
Edit the variables.tf file or pass variables:
bashterraform apply -var='regions=["nyc3", "lon1"]'
Change Droplet Size
Edit main.tf and change the size parameter:
hclsize = "s-2vcpu-2gb"
Add SSH Keys

Add your SSH key to DigitalOcean:

bash   doctl compute ssh-key create "my-key" --public-key "$(cat ~/.ssh/id_rsa.pub)"

Uncomment the SSH key section in main.tf:

hcl   data "digitalocean_ssh_key" "terraform" {
     name = "my-key"
   }
   
   resource "digitalocean_droplet" "web" {
     # ... other settings ...
     ssh_keys = [data.digitalocean_ssh_key.terraform.id]
   }
Accessing Your Droplets
After deployment, get the IP addresses:
bashterraform output
SSH into your droplets:
bashssh root@<droplet-ip-address>
Useful Terraform Commands
CommandDescriptionterraform initInitialize Terraform workspaceterraform planPreview changesterraform applyApply changesterraform destroyDestroy all resourcesterraform outputShow output valuesterraform state listList all resources in stateterraform showShow current stateterraform fmtFormat configuration filesterraform validateValidate configuration syntax
Managing Your Infrastructure
View Current Resources
bashterraform state list
Update Resources

Modify your .tf files
Run terraform plan to preview changes
Run terraform apply to apply changes

Destroy Resources
To destroy specific resources:
bashterraform destroy -target=digitalocean_droplet.web1
To destroy everything:
bashterraform destroy
Troubleshooting
Authentication Error
Error: Error: GET https://api.digitalocean.com/v2/account: 401 Unable to authenticate you
Solution: Check that your API token is set correctly:
bashecho $TF_VAR_do_token
Rate Limiting
Error: Error: GET https://api.digitalocean.com/v2/...: 429 Too Many Requests
Solution: Wait a few minutes before retrying. DigitalOcean has rate limits on API calls.
Resource Already Exists
Error: Error creating droplet: POST https://api.digitalocean.com/v2/droplets: 422
Solution: The resource name might already exist. Change the name in your configuration.
Best Practices

Never commit terraform.tfvars or any file containing secrets - Add to .gitignore
Use version control for your .tf files
Use remote state for team collaboration (S3, Terraform Cloud, etc.)
Tag your resources for better organization and cost tracking
Use variables instead of hardcoding values
Review plans before applying (terraform plan)
Use workspaces for different environments (dev, staging, prod)

Security Notes

Your API token has full access to your DigitalOcean account - keep it secure
Never commit tokens or sensitive data to version control
Rotate API tokens regularly
Use SSH keys instead of password authentication for droplets
Consider using DigitalOcean's VPC for private networking between droplets

Cost Monitoring
Check your monthly costs:
bashdoctl account get
Or visit the DigitalOcean billing page.
Additional Resources

Terraform DigitalOcean Provider Documentation
DigitalOcean API Documentation
Terraform CLI Documentation
DigitalOcean Community Tutorials

Support

DigitalOcean Support: cloud.digitalocean.com/support
Terraform Community: discuss.hashicorp.com
