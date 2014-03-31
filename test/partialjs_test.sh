function run_tests {
  echo "Some of these tests may take a while."
  echo " "

  assert "make node_modules/partial.js" \
    "make node_modules/partial.js"

  assert_dir "node_modules/partial.js" \
    "should be installed"

  echo " "
  echo "[INFO]: starting partial.js"
  make partial.js &
  sleep 2
  echo " "

  assert_grep "jobs" \
    "make partial.js" \
    "partial.js running"

  assert_grep "curl -si http://localhost:3000" \
    "HTTP/1.1 200 OK" \
    "curl partial.js"

  echo " "
  echo "[INFO]: stopping partial.js"
  pkill -9 -f "node index.js" 2>&1 > /dev/null
  sleep 2 # keeps output cleanish

  assert "make clean/partial.js" \
    "clean partial.js"

  refute_dir "node_modules/partial.js" \
    "remove partial.js"
}

# vim: set ft=sh:
