function run_tests {
  echo "Some of these tests may take a while."
  echo " "

  assert "make node_modules/.bin/geddy" \
    "make node_modules/geddy.js"

  assert_file "node_modules/.bin/geddy" \
    "geddy should be installed"

  echo " "
  echo "[INFO]: starting geddyjs"
  make geddy.js &
  sleep 2
  echo " "

  assert_grep "jobs" \
    "make geddy.js" \
    "geddy.js running"

  assert_grep "curl -si http://localhost:3000" \
    "HTTP/1.1 200 OK" \
    "curl geddy.js"

  echo " "
  echo "[INFO]: stopping geddy.js"
  pkill -9 -f ".bin/geddy" 2>&1 > /dev/null
  sleep 2 # keeps output cleanish

  assert "make clean/geddy" \
    "clean geddy"

  refute_dir "node_modules/geddy" \
    "remove geddy"
}

# vim: set ft=sh:
