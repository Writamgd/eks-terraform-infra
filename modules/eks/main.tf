module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  # -----------------------------
  # Cluster Basic Configuration
  # -----------------------------
  cluster_name    = var.cluster_name
  cluster_version = "1.29"

  # Enable modern authentication
  authentication_mode = "API_AND_CONFIG_MAP"

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true 

  # -----------------------------
  # Networking
  # -----------------------------
  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  # -----------------------------
  # Managed Node Group
  # -----------------------------
  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }

  # -----------------------------
  # EKS Access Entries (IMPORTANT)
  # -----------------------------
  access_entries = {
    jenkins = {
      principal_arn = "arn:aws:iam::975050049140:role/jenkins-ec2-role"

      policy_associations = {
        admin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }

  # -----------------------------
  # Tags
  # -----------------------------
  tags = {
    Environment = "dev"
  }
}