provider "kubernetes" {
  config_path = "~/.kube/config"  # Path to your kubeconfig file
}

resource "kubernetes_deployment" "flask-test" {
  metadata {
    name = "koko-app-deployment"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "koko-app"
      }
    }
    template {
      metadata {
        labels = {
          app = "koko-app"
        }
      }
      spec {
        container {
          image = "025946944436.dkr.ecr.ap-south-1.amazonaws.com/koko:latest"
          name  = "koko-app-container"
        }
      }
    }
  }
}