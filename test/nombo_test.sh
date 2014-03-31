function run_tests {
  echo "Some of these tests may take a while."
  echo " "

  assert "make node_modules/.bin/nombo" \
    "make node_modules/.bin/nombo"

  assert_file "node_modules/.bin/nombo" \
    "nombo should be installed"

  assert "make node_modules/socketcluster-server" \
    "make node_modules/socketcluster-server"

  assert_dir "node_modules/socketcluster-server" \
    "nombo should be setup"

  echo " "
  echo "[INFO]: starting nombo"
  make nombo &
  sleep 4
  echo " "

  assert_grep "jobs" \
    "make nombo" \
    "nombo running"

  assert_grep "curl -si http://localhost:3000" \
    "HTTP/1.1 200 OK" \
    "curl nombo"

  echo " "
  echo "[INFO]: stopping nombo"

  # nombo starts all kinds of crap
  pkill -9 -f "nombo/server.node" 2>&1 > /dev/null
  pkill -9 -f "node-hello-framework/node_modules/nombo" 2>&1 > /dev/null
  pkill -9 -f "node-hello-framework/node_modules/ndata" 2>&1 > /dev/null
  sleep 2 # keeps output cleanish
}

# vim: set ft=sh:
