function run_tests {
  echo "Some of these tests may take a while."
  echo " "

  assert "make node_modules/compound" \
    "make node_modules/compound"

  assert_dir "node_modules/compound" \
    "compound.js should be installed"

  assert "make compound.js/node_modules" \
    "make compound.js/node_modules"

  assert_dir "compound.js/node_modules" \
    "compound.js modules should be installed"

  echo " "
  echo "[INFO]: starting compound.js"
  make compound.js &
  sleep 2
  echo " "

  assert_grep "jobs" \
    "make compound.js" \
    "compound.js running"

  assert_grep "curl -si http://localhost:3000" \
    "HTTP/1.1 200 OK" \
    "curl compound.js"

  echo " "
  echo "[INFO]: stopping compound.js"
  kill $(jobs -p) 2>&1 > /dev/null
  sleep 2 # keeps output cleanish

  assert "make clean/compound.js" \
    "clean compound.js"

  refute_dir "node_modules/compound" \
    "remove compound"

  refute_dir "compound.js/node_modules" \
    "remove compound.js modules"
}

# vim: set ft=sh:
