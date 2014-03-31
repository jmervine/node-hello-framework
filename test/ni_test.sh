function run_tests {
  echo "Some of these tests may take a while."
  echo " "

  assert "make node_modules/ni" \
    "make node_modules/ni"

  assert_dir "node_modules/ni" \
    "ni should be installed"

  assert "make node_modules/connect" \
    "make node_modules/connect"

  assert_dir "node_modules/connect" \
    "connect should be installed"

  echo " "
  echo "[INFO]: starting ni"
  make ni &
  sleep 2
  echo " "

  assert_grep "jobs" \
    "make ni" \
    "ni running"

  assert_grep "curl -si http://localhost:3000" \
    "HTTP/1.1 200 OK" \
    "curl ni"

  echo " "
  echo "[INFO]: stopping ni"
  kill $(jobs -p) 2>&1 > /dev/null
  sleep 2 # keeps output cleanish

  assert "make clean/ni" \
    "clean ni"

  refute_dir "node_modules/connect" \
    "remove connect"

  refute_dir "node_modules/ni" \
    "remove ni"
}

# vim: set ft=sh:
