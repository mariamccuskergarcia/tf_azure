



locals {
  
  vm_name = format("vm%s%s", var.cohort,var.owner)
  os_name = format("%s-os-account", var.worker)
  sd_name = format("sd-%s-%s", var.cohort, var.owner)
  ni_name =  format("ni_%s_%s", var.cohort, var.owner)
  pip_name = format("pip_%s_%s", var.cohort, var.owner)

  default_tags = tomap({
    "cohort"  = var.cohort
    "env"     = var.env
    "owner"   = var.owner
    "purpose" = var.purpose
  })
}