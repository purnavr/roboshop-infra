instances = {
  frontend = {
    name = "frontend"
    type = "t3.small"
    Monitor = true
  }
  mongodb = {
    name = "mongodb"
    type = "t3.small"
  }
  catalogue = {
    name = "catalogue"
    type = "t3.small"
    Monitor = true
  }
  redis = {
    name = "redis"
    type = "t3.small"
  }
  user = {
    name = "user"
    type = "t3.small"
    Monitor = true
  }
  cart = {
    name = "cart"
    type = "t3.small"
    Monitor = true
  }
  mysql = {
    name = "mysql"
    type = "t3.small"
  }
  shipping = {
    name = "shipping"
    type = "t3.small"
    Monitor = true
  }
  rabbitmq = {
    name = "rabbitmq"
    type = "t3.small"
  }
  payment = {
    name = "payment"
    type = "t3.small"
    Monitor = true
  }
  dispatch = {
    name = "dispatch"
    type = "t3.small"
    Monitor = true
  }
}

env = "dev"

