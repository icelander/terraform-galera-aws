# Terraform Deployment of MariaDB Galera

## About

This is an example of a Terraform deployment for MariaDB Galera. It is intended as a way to get a self-hosted Xpand cluster running quickly for troubleshooting, demos, or learning. It should not be used in production.

## How To Use

### 1. Setup

 - **Configure AWS Credentials** by creating a file named `aws_creds` in the `terraform` directory with the information from AWS
 - **Configure SSH Keys** by creating a key pair in AWS and downloading the private key. Then edit `terraform/vars.tf` to set the `ssh_key_path` and `aws_key_name`
 - **Find your IP address** by going to https://ifconfig.me and edit `terraform/vars.tf` to set the `ssh-location` variable
 - **Download the Xpand `bz2` file** and place it in `deploy/lib`. Then update `vars.tf` so that `xpand_archive_filename` matches

Finally, *review all settings `terraform/vars.tf` to ensure they are correct.*

### 2. Terraform

Run `terraform plan -out a.plan` to validate Terraform and create the plan. Then run `terraform apply a.plan` to apply it.

**Note:** If you run into errors, read them carefully twice and then do what they say.

### 3. Configure Machines

First, run `deploy/setup.sh`. This will install the SSH config on the jumpbox, copy the deploy directory, and connect via SSH with a SOCKS proxy. You will be dropped into the shell of the jumpbox.

From here, you can connect to the machines in the cluster via SSH to install Xpand Manually:

 - `ssh galera[0-N]`

Or, you can run this from the jumpbox to setup Xpand and Maxscale:

```bash
cd ~/deploy
./galera_setup.sh
```

When this is complete you will have a Galera cluster ready to go!