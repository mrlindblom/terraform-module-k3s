terraform {
  required_version = "~> 0.12"
  experiments      = [variable_validation]
  required_providers {
    http   = "~> 1.2"
    null   = "~> 2.1"
    random = "~> 2.2"
  }
}

// Generate the k3s token used by all nodes to join the cluster
resource "random_password" "k3s_cluster_secret" {
  length  = 48
  special = false
}

locals {
  managed_annotation_enabled = contains(var.managed_fields, "annotation")
  managed_label_enabled      = contains(var.managed_fields, "label")
  managed_taint_enabled      = contains(var.managed_fields, "taint")
}
