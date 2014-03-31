function run_tests {
  echo "Some of these tests may take a while."
  echo " "

  assert "make node_modules/hapi" \
    "make node_modules/hapi"

  assert_dir "node_modules/hapi" \
    "should be installed"

  echo " "
  echo "[INFO]: starting hapi"
  make hapi &
  sleep 2
  echo " "

  assert_grep "jobs" \
    "make hapi" \
    "hapi running"

  assert_grep "curl -si http://localhost:3000" \
    "HTTP/1.1 200 OK" \
    "curl hapi"

  echo " "
  echo "[INFO]: stopping hapi"
  kill $(jobs -p) 2>&1 > /dev/null
  sleep 2 # keeps output cleanish

  assert "make clean/hapi" \
    "clean hapi"

  refute_dir "node_modules/hapi" \
    "remove hapi"
}

# vim: set ft=sh:
