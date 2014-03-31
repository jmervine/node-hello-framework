function run_tests {
  echo "Some of these tests may take a while."
  echo " "

  assert "make node_modules/socket.io" \
    "make node_modules/socket.io"

  assert_dir "node_modules/socket.io" \
    "should be installed"

  echo " "
  echo "[INFO]: starting socket.io"
  make socket.io &
  sleep 2
  echo " "

  assert_grep "jobs" \
    "make socket.io" \
    "socket.io running"

  assert_grep "curl -si http://localhost:3000" \
    "HTTP/1.1 200 OK" \
    "curl socket.io"

  echo " "
  echo "[INFO]: stopping socket.io"
  kill $(jobs -p) 2>&1 > /dev/null
  sleep 2 # keeps output cleanish

  assert "make clean/socket.io" \
    "clean socket.io"

  refute_dir "node_modules/socket.io" \
    "remove socket.io"
}

# vim: set ft=sh:
