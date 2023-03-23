locals {
  users = {
    "ondrej" = {
      email      = "ondrej@example.com"
      first_name = "Ondrej"
      last_name  = "Sika"
      enabled    = true
      groups     = ["admins"]
      department = "IT"
    }
    "vojtech" = {
      email      = "vojtech@example.com"
      first_name = "Vojtech"
      last_name  = "Mares"
      enabled    = true
      groups     = ["editors"]
      department = "Support"
    }
  }
}

locals {
  roles = {
    "foo-editor" = {}
    "foo-viewer" = {}
    "bar-editor" = {}
    "bar-viewer" = {}
  }
}

locals {
  groups = {
    "admins" = {
      roles = ["foo-editor", "bar-editor"]
    }
    "editors" = {
      roles = ["foo-editor", "bar-editor"]
    }
    "viewers" = {
      roles = ["foo-viewer", "bar-viewer"]
    }
  }
}
