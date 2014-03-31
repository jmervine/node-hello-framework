function run_tests {
  echo "Some of these tests may take a while."
  echo " "

  assert "make node_modules/socketstream" \
    "install socketstream"

  assert_dir "node_modules/socketstream" \
    "socketstream should be installed"

  assert "make socketstream/node_modules" \
    "install socketstream modules"

  assert_dir "socketstream/node_modules" \
    "socketstream modules are installed"

  echo " "
  echo "[INFO]: starting socketstream"
  make socketstream &
  sleep 2
  echo " "

  assert_grep "jobs" \
    "make socketstream" \
    "socketstream running"

  assert_grep "curl -si http://localhost:3000" \
    "HTTP/1.1 200 OK" \
    "curl socketstream"

  echo " "
  echo "[INFO]: stopping socketstream"
  pkill -9 -f "node app.js" 2>&1 > /dev/null
  sleep 2 # keeps output cleanish

  assert "make clean/socketstream" \
    "remove socketstream modules"

  refute_dir "node_modules/socketstream" \
    "remove socketstream"

  refute_file "node_modules/.bin/socketstream" \
    "remove socketstream bin"

  refute_dir "socketstream/node_modules" \
    "remove socketstream modules"
}

# vim: set ft=sh:
