# PostgreSQL service
# Deployment pour PostgreSQL
resource "kubernetes_deployment" "postgres" {
  metadata {
    name      = "postgres-deployment"
    namespace = kubernetes_namespace.app.metadata[0].name
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "postgres"
      }
    }

    template {
      metadata {
        labels = {
          app = "postgres"
        }
      }

      spec {
        container {
          name  = "postgres"
          image = "postgres:12"
          env {
            name  = "POSTGRES_USER"
            value = var.postgres_user
          }
          env {
            name  = "POSTGRES_PASSWORD"
            value = var.postgres_password
          }
          env {
            name  = "POSTGRES_DB"
            value = var.postgres_db
          }
          port {
            container_port = 5432
          }

        }

      }
    }
  }
}

# Redis service
resource "kubernetes_deployment" "redis" {
  metadata {
    name      = "redis"
    namespace = kubernetes_namespace.app.metadata[0].name
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "redis"
      }
    }
    template {
      metadata {
        labels = {
          app = "redis"
        }
      }
      spec {
        container {
          name  = "redis"
          image = "redis:alpine"
          port {
            container_port = 6379
          }
        }
      }
    }
  }
}

# Vote service
resource "kubernetes_deployment" "vote" {
  metadata {
    name      = "vote"
    namespace = kubernetes_namespace.app.metadata[0].name
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "vote"
      }
    }
    template {
      metadata {
        labels = {
          app = "vote"
        }
      }
      spec {
        container {
          name  = "vote"
          image = "epitechcontent/t-dop-600-poll:k8s"
          port {
            container_port = 80
          }
          env {
            name  = "REDIS_HOST"
            value = var.redis_host
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "worker" {
  metadata {
    name      = "worker"
    namespace = kubernetes_namespace.app.metadata[0].name
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "worker"
      }
    }
    template {
      metadata {
        labels = {
          app = "worker"
        }
      }
      spec {
        container {
          name  = "worker"
          image = "epitechcontent/t-dop-600-worker:k8s"
          env {
            name  = "REDIS_HOST"
            value = var.redis_host
          }
          env {
            name  = "POSTGRES_HOST"
            value = var.postgres_host
          }
          env {
            name  = "POSTGRES_PORT"
            value = var.postgres_port
          }
          env {
            name  = "POSTGRES_USER"
            value = var.postgres_user
          }
          env {
            name  = "POSTGRES_PASSWORD"
            value = var.postgres_password
          }
          env {
            name  = "POSTGRES_DB"
            value = var.postgres_db
          }
        }
      }
    }
  }
}

# Result service
resource "kubernetes_deployment" "result" {
  metadata {
    name      = "result"
    namespace = kubernetes_namespace.app.metadata[0].name
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "result"
      }
    }
    template {
      metadata {
        labels = {
          app = "result"
        }
      }
      spec {
        container {
          name  = "result"
          image = "epitechcontent/t-dop-600-result:k8s"
          env {
            name  = "POSTGRES_HOST"
            value = var.postgres_host
          }
          env {
            name  = "POSTGRES_PORT"
            value = var.postgres_port
          }
          env {
            name  = "POSTGRES_USER"
            value = var.postgres_user
          }
          env {
            name  = "POSTGRES_PASSWORD"
            value = var.postgres_password
          }
          env {
            name  = "POSTGRES_DB"
            value = var.postgres_db
          }
        }
      }
    }
  }
}