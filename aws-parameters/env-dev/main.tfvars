parameters = [
  { name  = "test", value = "hello world", type = "String" },
  { name  = "dev.frontend.catalogue_url", value = "http://catalogue-dev.roboz.online:80/", type = "String" },
  { name  = "dev.frontend.user_url", value = "http://user-dev.roboz.online:80/", type = "String" },
  { name  = "dev.frontend.cart_url", value = "http://cart-dev.roboz.online:80/", type = "String" },
  { name  = "dev.frontend.shipping_url", value = "http://shipping-dev.roboz.online:80/", type = "String" },
  { name  = "dev.frontend.payment_url", value = "http://payment-dev.roboz.online:80/", type = "String" },
  { name  = "dev.cart.redis_host", value = "redis-dev.roboz.online", type = "String" },
  { name  = "dev.cart.catalogue_host", value = "catalogue-dev.roboz.online", type = "String" },
  { name  = "dev.cart.catalogue_port", value = "80", type = "String" },
  { name  = "dev.catalogue.mongo", value = "true", type = "String" },
  #{ name  = "dev.catalogue.mongo", value = "MONGO=true", type = "String" },
  { name  = "dev.catalogue.mongo_url", value = "mongodb://mongodb-dev.roboz.online:27017/catalogue", type = "String" },
  { name  = "dev.user.mongo", value = "MONGO=true", type = "String" },
  { name  = "dev.user.redis_host", value = "redis-dev.roboz.online", type = "String" },
  { name  = "dev.user.mongo_url", value = "mongodb://mongodb-dev.roboz.online:27017/users", type = "String" },
  { name  = "dev.shipping.cart_endpoint", value = "cart-dev.roboz.online:80", type = "String" },
  { name  = "dev.shipping.db_host", value = "mysql-dev.roboz.online", type = "String" },
  { name  = "dev.payment.cart_host", value = "cart-dev.roboz.online", type = "String" },
  { name  = "dev.payment.cart_port", value = "80", type = "String" },
  { name  = "dev.payment.user_host", value = "user-dev.roboz.online", type = "String" },
  { name  = "dev.payment.user_port", value = "80", type = "String" },
  { name  = "dev.payment.ampq_host", value = "rabbitmq-dev.roboz.online", type = "String" },
  { name  = "dev.dispatch.ampq_host", value = "rabbitmq-dev.roboz.online", type = "String" },
]

secrets = [
  { name  = "dev.mysql.pass", value = "RoboShop@1", type = "SecureString" },
  { name  = "dev.payment.ampq_user", value = "roboshop", type = "SecureString" },
  { name  = "dev.payment.ampq_pass", value = "roboshop123", type = "SecureString" },
  { name  = "dev.rabbitmq.user", value = "roboshop", type = "SecureString" },
  { name  = "dev.rabbitmq.password", value = "roboshop123", type = "SecureString" },
  { name  = "dev.dispatch.ampq_user", value = "roboshop", type = "SecureString" },
  { name  = "dev.dispatch.ampq_pass", value = "roboshop123", type = "SecureString" },
  { name  = "dev.docdb.user", value = "admin1", type = "SecureString" },
  { name  = "dev.docdb.pass", value = "RoboShop1", type = "SecureString" },
  { name  = "dev.rds.user", value = "admin1", type = "SecureString" },
  { name  = "dev.rds.pass", value = "RoboShop1", type = "SecureString" },
]



