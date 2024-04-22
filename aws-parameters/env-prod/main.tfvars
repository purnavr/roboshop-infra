parameters = [
#  { name  = "test", value = "hello world", type = "String" },
  { name  = "prod.frontend.catalogue_url", value = "http://catalogue-prod.roboz.online:80/", type = "String" },
  { name  = "prod.frontend.user_url", value = "http://user-prod.roboz.online:80/", type = "String" },
  { name  = "prod.frontend.cart_url", value = "http://cart-prod.roboz.online:80/", type = "String" },
  { name  = "prod.frontend.shipping_url", value = "http://shipping-prod.roboz.online:80/", type = "String" },
  { name  = "prod.frontend.payment_url", value = "http://payment-prod.roboz.online:80/", type = "String" },
  { name  = "prod.cart.redis_host", value = "redis-prod.roboz.online", type = "String" },
  { name  = "prod.cart.catalogue_host", value = "catalogue-prod.roboz.online", type = "String" },
  { name  = "prod.cart.catalogue_port", value = "80", type = "String" },
  { name  = "prod.catalogue.mongo", value = "true", type = "String" },
  #{ name  = "prod.catalogue.mongo", value = "MONGO=true", type = "String" },
  { name  = "prod.catalogue.mongo_url", value = "mongodb://mongodb-prod.roboz.online:27017/catalogue", type = "String" },
  { name  = "prod.user.mongo", value = "true", type = "String" },
  #{ name  = "prod.user.mongo", value = "MONGO=true", type = "String" },
  { name  = "prod.user.redis_host", value = "redis-prod.roboz.online", type = "String" },
  { name  = "prod.user.mongo_url", value = "mongodb://mongodb-prod.roboz.online:27017/users", type = "String" },
  { name  = "prod.shipping.cart_endpoint", value = "cart-prod.roboz.online:80", type = "String" },
  { name  = "prod.shipping.db_host", value = "mysql-prod.roboz.online", type = "String" },
  { name  = "prod.payment.cart_host", value = "cart-prod.roboz.online", type = "String" },
  { name  = "prod.payment.cart_port", value = "80", type = "String" },
  { name  = "prod.payment.user_host", value = "user-prod.roboz.online", type = "String" },
  { name  = "prod.payment.user_port", value = "80", type = "String" },
  { name  = "prod.payment.ampq_host", value = "rabbitmq-prod.roboz.online", type = "String" },
  { name  = "prod.dispatch.ampq_host", value = "rabbitmq-prod.roboz.online", type = "String" },
]

secrets = [
  { name  = "prod.mysql.pass", value = "RoboShop@1", type = "SecureString" },
  { name  = "prod.payment.ampq_user", value = "roboshop", type = "SecureString" },
  { name  = "prod.payment.ampq_pass", value = "roboshop123", type = "SecureString" },
  { name  = "prod.rabbitmq.user", value = "roboshop", type = "SecureString" },
  { name  = "prod.rabbitmq.password", value = "roboshop123", type = "SecureString" },
  { name  = "prod.dispatch.ampq_user", value = "roboshop", type = "SecureString" },
  { name  = "prod.dispatch.ampq_pass", value = "roboshop123", type = "SecureString" },
  { name  = "prod.docdb.user", value = "admin1", type = "SecureString" },
  { name  = "prod.docdb.pass", value = "RoboShop1", type = "SecureString" },
  { name  = "prod.rds.user", value = "admin1", type = "SecureString" },
  { name  = "prod.rds.pass", value = "RoboShop1", type = "SecureString" },
  { name  = "prod.ssh.pass", value = "DevOps321", type = "SecureString" },
]



