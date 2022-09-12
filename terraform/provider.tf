provider "aws" {
  profile                   = "${var.aws_profile}"
  shared_credentials_files  = ["./aws-creds"]
  region                    = "${var.aws_region}"
}