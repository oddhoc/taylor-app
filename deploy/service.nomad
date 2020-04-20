job "taylor-test" {
  datacenters = ["local"]
  type = "service"

  update {
    auto_revert = true
    healthy_deadline = "1m"
    min_healthy_time = "30s"
    max_parallel = 1
    progress_deadline = "3m"
  }

  group "taylor-test" {
    count = 2

    restart {
      attempts = 3
      interval = "5m"
      delay = "10s"
      mode = "fail"
    }

    task "taylor-test" {
      driver = "docker"
      config {
        image = "tskinn12/test-app:[[ env "DEPLOY_TAG" ]]"
        port_map {
          http = 80
        }
      }

      resources {
        network {
          mbits = 10
          port  "http"  {}
        }
      }

      service {
        name = "taylor-test"
        tags = ["urlprefix-/httpbin strip=/httpbin"]
        port = "http"
        check {
          name     = "taylor-test http alive"
          type     = "http"
          path     = "/status/400"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
