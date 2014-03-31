function run_tests {
  echo "Some of these tests may take a while."
  echo " "

  assert "make node_modules/connect" \
    "make node_modules/connect"

  assert_dir "node_modules/connect" \
    "should be installed"

  echo " "
  echo "[INFO]: starting connect"
  make connect &
  sleep 2
  echo " "

  assert_grep "jobs" \
    "make connect" \
    "connect running"

  assert_grep "curl -si http://localhost:3000" \
    "HTTP/1.1 200 OK" \
    "curl connect"

  echo " "
  echo "[INFO]: stopping connect"
  kill $(jobs -p) 2>&1 > /dev/null
  sleep 2 # keeps output cleanish

  assert "make clean/connect" \
    "clean connect"

  refute_dir "node_modules/connect" \
    "remove connect"
}

# vim: set ft=sh:
