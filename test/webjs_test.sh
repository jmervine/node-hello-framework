function run_tests {
  echo "Some of these tests may take a while."
  echo " "

  assert "make node_modules/webjs" \
    "make node_modules/webjs"

  assert_dir "node_modules/webjs" \
    "should be installed"

  echo " "
  echo "[INFO]: starting webjs"
  make webjs &
  sleep 2
  echo " "

  assert_grep "jobs" \
    "make webjs" \
    "webjs running"

  assert_grep "curl -si http://localhost:3000" \
    "HTTP/1.1 200 OK" \
    "curl webjs"

  echo " "
  echo "[INFO]: stopping webjs"
  kill $(jobs -p) 2>&1 > /dev/null
  sleep 2 # keeps output cleanish
}

# vim: set ft=sh:
