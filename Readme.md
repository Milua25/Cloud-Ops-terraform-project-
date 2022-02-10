# Important Note To Execute this script

## Step-01: Manually Create an S3 bucket for storing statefile
- First create an s3 bucket where you want to store the statefile and change the values in the backend configuration

## Step-02: Introduction

- Create environmental variables for both access key and secret access key for Account 1 and Account 2

Example:
export TF_VAR_ACCESS_KEY_ID_1 = XXXXXXXXXXXXX
export TF_VAR_SECRET_ACCESS_KEY_1 = XXXXXXXX
export TF_VAR_ACCESS_KEY_ID_2 = XXXXXXXXXXXXX
export TF_VAR_SECRET_ACCESS_KEY_2 = XXXXXXXX

## Step - 03: Change the values in the terraform.tfvars 
- Change the values in the terrafom.tfvars file to where you want to deploy your infrastruce. 

- Also make sure to chage the account_id and provide the account id for account 1

example: account_1_id  = XXXX

## 



