resource "kubernetes_deployment" "webserver" {
  metadata {
    name = "webserver"
    labels = {
      webserver = "cloudskillsnginx"
    }
  }

  spec {
    replicas = 2

    template {
      metadata {
        labels = {
          webserver = "cloudskillsnginx"
        }
      }

      spec {
        container {
          image = "nginx:latest"
          name  = "cloudskillsnginx"

          resources {
            limits {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}