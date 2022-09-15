module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "2.2.0"
  bucket = "project-code-786"
  # insert the 5 required variables here
}
