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
  EDITORS = [
    "foo-editor",
    "foo-viewer",
    "bar-editor",
    "bar-viewer",
  ]
  groups = {
    "admins" = {
      roles = local.EDITORS,
      role_ids = [
        keycloak_role.administrator.id,
      ]
    }
    "editors" = {
      roles = ["foo-editor", "bar-editor"]
      role_ids = [
        keycloak_role.uzivatel.id,
      ]
    }
    "viewers" = {
      roles = ["foo-viewer", "bar-viewer"]
      role_ids = [
        keycloak_role.uzivatel.id,
      ]
    }
  }
}
