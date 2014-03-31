function run_tests {
  echo "Some of these tests may take a while."
  echo " "

  assert "make node_modules/sails" \
    "make node_modules/sails"

  assert_dir "node_modules/sails" \
    "sails should be installed"

  assert "make sails.js/node_modules" \
    "sails modules should be installed"

  assert_dir "sails.js/node_modules" \
    "sails modules should be installed"

  echo " "
  echo "[INFO]: starting sails"
  make sails.js &
  sleep 2
  echo " "

  assert_grep "jobs" \
    "make sails.js" \
    "sails running"

  assert_grep "curl -si http://localhost:3000" \
    "HTTP/1.1 200 OK" \
    "curl sails"

  echo " "
  echo "[INFO]: stopping sails"
  pkill -9 -f "sails" 2>&1 > /dev/null
  sleep 2 # keeps output cleanish

  assert "make clean/sails.js" \
    "remove sails modules"

  refute_dir "node_modules/sails" \
    "remove sails"

  refute_file "node_modules/.bin/sails" \
    "remove sails bin"

  refute_dir "sails.js/node_modules" \
    "remove sails modules"
}

# vim: set ft=sh:
