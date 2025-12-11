env = "dev"


db_components = {
  mongodb = {
    ports         = { ssh = 22, mongodb = 27017 }
    instance_type = "t3.small"
  }
  mysql = {
    ports         = { ssh = 22, mysql = 3306 }
    instance_type = "t3.small"
  }
  rabbitmq = {
    ports         = { ssh = 22, rabbitmq = 5672 }
    instance_type = "t3.small"
  }
  redis = {
    ports         = { ssh = 22, redis = 6379 }
    instance_type = "t3.small"
  }
}

zone_id = "Z057881017RC0RRKVUX8E"
ami     = "ami-09c813fb71547fc4f"

app_components = {
  catalogue = {
    min_nodes     = 2
    max_nodes     = 10
    instance_type = "t3.micro"
    ports         = { ssh = 22, app = 8080 }
  }
}

default_vpc_id = "vpc-0f995da5da96d9248"

