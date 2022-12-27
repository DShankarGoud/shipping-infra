module "vpc" {
  source = "git::https://github.com/DShankarGoud/tf-module-vpc.git"
  VPC_CIDR_BLOCK = var.VPC_CIDR_BLOCK
  COMPONENT = var.COMPONENT
  ENV = var.ENV
  SUBNET_CIDR = var.SUBNET_CIDR
  AZ = var.AZ
}

module "mysql" {
  depends_on          = [module.vpc]
  source              = "git::https://github.com/DShankarGoud/tf-module-rds-mysql.git"
  ENGINE              = var.ENGINE
  ENGINE_VERSION      = var.ENGINE_VERSION
  INSTANCE_CLASS      = var.INSTANCE_CLASS
  NAME                = var.NAME
  SKIP_FINAL_SNAPSHOT = var.SKIP_FINAL_SNAPSHOT
  ENV                 = var.ENV
  COMPONENT           = var.COMPONENT
}
