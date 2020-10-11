output "vpc" {
  value = module.vpc
}
 
output "sg" {
  value = {
    lb     = module.lb_sg.security_group.id
    websvr = module.websvr_sg.security_group.id
    bastion = module.bastion_sg.security_group.id
  }
}