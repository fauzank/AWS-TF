module "autoscaling" {
  source      = "./modules/autoscaling"
  namespace   = var.namespace
  ssh_keypair = var.ssh_keypair
 
  vpc       = module.networking.vpc
  sg        = module.networking.sg
}
 
module "networking" {
  source    = "./modules/networking"
  namespace = var.namespace
}

module "bastion" {
  source    = "./modules/bastion"
  namespace = var.namespace
  vpc = module.networking.vpc
  sg  = module.networking.sg
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCvDWj7nVgUClYCzt1Fej0QZ4yuplNd68wf6m1snFvxEWUtOhqYWdnPabc4o+k22d/ipg3CXNyc12c0U6tUKatvKHe/GHnWiDnc2bUHedXaCY1QGmCR5w7xb7TgjFbUr9C0/kx6IDBRYkN+JmTgSOr2XzP01/IvVlhsNFj+EBlgfaXQRMUgkd/uYfTxBfMEB/Xrz1PtKot8nYepvDOd9CweTzKP/oAHNeE9TyASisAcDsdZgJeAUF19pUwUBboAX/3H9pd/bx/jAoacKi74cUR5fK1BPw7Aou07g7v/4mNls237Jg2wB+tUQTg4jsGeLJYQNDFAzIWfJVtXw8OPw7cH36mqL/qWrZhDEcc73d5w0TavpHF/5Z6TDZML47R5B1XVOl4BMvV4jMvgjU6SDn5hYn372TOi24s5RNBsQ3BuhZtR+qy1oLscx+zB5sMDtLrtquviUutvklMTEcyCs+5NKC9bjPq3qwGMMCZysixeSQBC94ATXRSzJvzQvvZ8Cy8= faukhan@Fauzans-MacBook-Pro.local"
}