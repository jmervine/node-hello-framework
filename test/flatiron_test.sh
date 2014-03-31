function run_tests {
  echo "Some of these tests may take a while."
  echo " "

  assert "make node_modules/flatiron" \
    "make node_modules/flatiron"

  assert_dir "node_modules/flatiron" \
    "flatiron should be installed"

  assert "make node_modules/union" \
    "make node_modules/flatiron"

  assert_dir "node_modules/union" \
    "should be installed"

  echo " "
  echo "[INFO]: starting flatiron"
  make flatiron &
  sleep 2
  echo " "

  assert_grep "jobs" \
    "make flatiron" \
    "flatiron running"

  assert_grep "curl -si http://localhost:3000" \
    "HTTP/1.1 200 OK" \
    "curl flatiron"

  echo " "
  echo "[INFO]: stopping flatiron"
  kill $(jobs -p) 2>&1 > /dev/null
  sleep 2 # keeps output cleanish

  assert "make clean/flatiron" \
    "clean flatiron"

  refute_dir "node_modules/flatiron" \
    "remove union"

  refute_dir "node_modules/union" \
    "remove union"
}

# vim: set ft=sh:
