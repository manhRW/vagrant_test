name "testapache"
description "description for cookbooks"
run_list(
  "selinux",
  "postfix",
  "testapache::db",
  "testapache::php",
  "testapache::server",
  "memcached"
  ) 
