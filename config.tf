locals {
  users = {
    "ondrej" = {
      email      = "ondrej@example.com"
      first_name = "Ondrej"
      last_name  = "Sika"
      enabled    = true
      group_ids = [
        module.group--admins.id,
      ]
      department = "IT"
    }
    "vojtech" = {
      email      = "vojtech@example.com"
      first_name = "Vojtech"
      last_name  = "Mares"
      enabled    = true
      group_ids = [
        module.group--viewers.id,
      ]
      department = "Support"
    }
  }
}
