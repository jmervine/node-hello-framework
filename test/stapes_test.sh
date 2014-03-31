function run_tests {
  echo "Some of these tests may take a while."
  echo " "

  echo " "
  echo "[INFO]: starting stapes"
  make stapes &
  sleep 2
  echo " "

  assert_grep "jobs" \
    "make stapes" \
    "stapes running"

  assert_grep "curl -si http://localhost:3000" \
    "HTTP/1.1 200 OK" \
    "curl stapes"

  echo " "
  echo "[INFO]: stopping stapes"
  kill $(jobs -p) 2>&1 > /dev/null
  sleep 2 # keeps output cleanish
}

# vim: set ft=sh:
