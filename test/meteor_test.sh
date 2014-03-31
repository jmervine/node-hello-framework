function run_tests {
  echo "Some of these tests may take a while."
  echo " "

  assert "make node_modules/meteor" \
    "make node_modules/meteor"

  assert_dir "node_modules/meteor" \
    "meteor should be installed"

  # Running 'list' because it's will trigger setup,
  # print stuff we don't care about and then return
  # a zero exit status if successful.
  #
  # I would prefer to use '--help', but it returns a
  # non-zero exit status.
  assert "node_modules/meteor/meteor list" \
    "setup meteor"

  echo " "
  echo "[INFO]: starting meteor"
  make meteor.js &
  sleep 2
  echo " "

  assert_grep "jobs" \
    "make meteor.js" \
    "meteor running"

  assert_grep "curl -si http://localhost:3000" \
    "HTTP/1.1 200 OK" \
    "curl meteor"

  echo " "
  echo "[INFO]: stopping meteor"
  pkill -9 -f "meteor.js" 2>&1 > /dev/null
  sleep 2 # keeps output cleanish

  assert "make clean/meteor" \
    "clean meteor"

  refute_dir "node_modules/meteor" \
    "remove meteor module"
}

# vim: set ft=sh:
