datacenter = "wopr1" 
data_dir = "/opt/nomad"  
bind_addr  = "0.0.0.0"

server { 
  enabled = true 
  bootstrap_expect = 1 
}
client {
  enabled = true
  servers = ["127.0.0.1:4646"]
  options = {
    "driver.blacklist" = "java"
    }
}  