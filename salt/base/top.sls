base:
  "*":
    - init.init
prod:
  "node123":
   - cluster.haproxy-outside
