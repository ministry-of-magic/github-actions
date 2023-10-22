terraform {
  required_version = "1.5.6"

  backend "remote" {
    hostname = "ministry-of-magic.scalr.io"
    organization = "env-tqaqjimtnmmgiv0"

    workspaces {
      name = "github-actions"
    }
  }

  required_providers {
    scratch = {
      source = "BrendanThompson/scratch"
    }
  }
}

resource "scratch_string" "this" {
  in = "Hello, GitHub Actions"
}

output "github_actions_string" {
  value = scratch_string.this.in
}
