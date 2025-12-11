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



