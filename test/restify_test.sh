function run_tests {
  echo "Some of these tests may take a while."
  echo " "

  assert "make node_modules/restify" \
    "make node_modules/restify"

  assert_dir "node_modules/restify" \
    "should be installed"

  echo " "
  echo "[INFO]: starting restify"
  make restify &
  sleep 2
  echo " "

  assert_grep "jobs" \
    "make restify" \
    "restify running"

  assert_grep "curl -si http://localhost:3000" \
    "HTTP/1.1 200 OK" \
    "curl restify"

  echo " "
  echo "[INFO]: stopping restify"
  kill $(jobs -p) 2>&1 > /dev/null
  sleep 2 # keeps output cleanish

  assert "make clean/restify" \
    "clean restify"

  refute_dir "node_modules/restify" \
    "remove restify"
}

# vim: set ft=sh:
