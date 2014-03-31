function run_tests {
  echo "Some of these tests may take a while."
  echo " "

  assert "make node_modules/.bin/lcm" \
    "make node_modules/.bin/lcm"

  assert_file "node_modules/.bin/lcm" \
    "lcm should be installed"

  assert "make locomotive.js/node_modules" \
    "locomotive.js modules should be installed"

  assert_dir "locomotive.js/node_modules" \
    "locomotive.js modules should be installed"

  echo " "
  echo "[INFO]: starting locomotive.js"
  make locomotive.js &
  sleep 2
  echo " "

  assert_grep "jobs" \
    "make locomotive.js" \
    "locomotive.js running"

  assert_grep "curl -si http://localhost:3000" \
    "HTTP/1.1 200 OK" \
    "curl locomotive.js"

  echo " "
  echo "[INFO]: stopping locomotive.js"
  pkill -9 -f "lcm server" 2>&1 > /dev/null
  sleep 2 # keeps output cleanish

  assert "make clean/locomotive.js" \
    "remove locomotive.js modules"

  refute_dir "node_modules/locomotive" \
    "remove locomotive"

  refute_file "node_modules/.bin/lcm" \
    "remove lcm"

  refute_dir "locomotive.js/node_modules" \
    "remove locomotive.js modules"
}

# vim: set ft=sh:
