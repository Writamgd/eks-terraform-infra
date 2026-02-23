resource "aws_ecr_repository" "eksdemo" {
  name = "eksdemo-app"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Environment = "dev"
  }
}