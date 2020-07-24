# Terraforming SageMkaker Notebook Instance on AWS using Terraform

1. Clone this repo:
    ```sh
    git clone git@github.com:DourivalPimentel/terraformingSageMakerNBinstance.git
    ```
2. If you don't have AWS Cli or Terraform setup, follow the tutorials bellow:
    1. Install [Terraform](https://askubuntu.com/questions/983351/how-to-install-terraform-in-ubuntu) to spin up the EC2 from command line
    2. Create a [new AWS account](https://aws.amazon.com/pt/) with [programatic access](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html#id_users_create_console).
    3. Install [AWS Cli](https://linuxhint.com/install_aws_cli_ubuntu/) to allow access to your AWS account.
3. Go to the projects folder:
    ```
    cd terraformingSageMakerNBinstance
    ```
4. Start Terraform:
    ```sh
    terraform init
    ```
5. Deploy as follow:
   
    ```sh
    terraform apply -var-file="var.tfvars"
    ```

## Refs:

https://medium.com/@yuyasugano/machine-learning-infrastructure-terraforming-sagemaker-part-2-f2460a9a4663
