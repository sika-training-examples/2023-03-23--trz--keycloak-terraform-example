locals {
  users = {
    "ondrej" = {
      email      = "ondrej@example.com"
      first_name = "Ondrej"
      last_name  = "Sika"
      enabled    = true
      groups     = ["admins"]
    }
    "vojtech" = {
      email      = "vojtech@example.com"
      first_name = "Vojtech"
      last_name  = "Mares"
      enabled    = true
      groups     = ["editors"]
    }
  }
}

locals {
  groups = {
    "admins" = {
    }
    "editors" = {
    }
    "viewers" = {
    }
  }
}
