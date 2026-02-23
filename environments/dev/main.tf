module "vpc" {
  source       = "../../modules/vpc"
  cluster_name = var.cluster_name
}

module "ecr" {
  source          = "../../modules/ecr"
  repository_name = var.repository_name
}

module "eks" {
  source       = "../../modules/eks"
  cluster_name = var.cluster_name

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet_ids
}