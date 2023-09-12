vpc = {
  default = {
    main = {
      cidr    = "10.0.0.0/16"
      subnets = {
        public = {
          public1 = { cidr = "10.0.0.0/16", az = "us-east-1a" }
          public2 = { cidr = "10.0.1.0/16", az = "us-east-1b" }
        }
        app = {
          app1 = { cidr = "10.0.2.0/16", az = "us-east-1a" }
          app2 = { cidr = "10.0.3.0/16", az = "us-east-1b" }
        }
        web = {
          web1 = { cidr = "10.0.2.0/16", az = "us-east-1a" }
          web2 = { cidr = "10.0.3.0/16", az = "us-east-1b" }
        }
      }
    }
  }
}

#output "all_subnets" {
#  value = [ for k,v in lookup(lookup(var.vpc, main,null), "subnets" ,null ) : v ]
#}

locals {
  public = { for k,v in merge(var.vpc["main"]["subnets"]["public"]): k => v }
  app = { for k,v in merge(var.vpc["main"]["subnets"]["app"]): k => v }
  db = { for k,v in merge(var.vpc["main"]["subnets"]["db"]): k => v }
}

output "all_subnutes" {
        value = merge(local.public, local.db ,local.app)
}
