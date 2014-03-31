function run_tests {
  echo " "
  echo "[INFO]: starting node.js"
  make node.js &
  sleep 2
  echo " "

  assert_grep "jobs" \
    "make node.js" \
    "node.js running"

  assert_grep "curl -si http://localhost:3000" \
    "HTTP/1.1 200 OK" \
    "curl node.js"

  echo " "
  echo "[INFO]: stopping node.js"
  kill $(jobs -p) 2>&1 > /dev/null
  sleep 2 # keeps output cleanish
}

# vim: set ft=sh:
