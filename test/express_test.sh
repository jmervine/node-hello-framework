function run_tests {
  echo "Some of these tests may take a while."
  echo " "

  assert "make node_modules/express" \
    "make node_modules/express"

  assert_dir "node_modules/express" \
    "should be installed"

  echo " "
  echo "[INFO]: starting express"
  make express &
  sleep 2
  echo " "

  assert_grep "jobs" \
    "make express" \
    "express running"

  assert_grep "curl -si http://localhost:3000" \
    "HTTP/1.1 200 OK" \
    "curl express"

  echo " "
  echo "[INFO]: stopping express"
  kill $(jobs -p) 2>&1 > /dev/null
  sleep 2 # keeps output cleanish

  assert "make clean/express" \
    "clean express"

  refute_dir "node_modules/express" \
    "remove express"
}

# vim: set ft=sh:
