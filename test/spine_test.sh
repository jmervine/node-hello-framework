function run_tests {
  echo "Some of these tests may take a while."
  echo " "

  echo " "
  echo "[INFO]: starting spine"
  make spine &
  sleep 2
  echo " "

  assert_grep "jobs" \
    "make spine" \
    "spine running"

  assert_grep "curl -si http://localhost:3000" \
    "HTTP/1.1 200 OK" \
    "curl spine"

  echo " "
  echo "[INFO]: stopping spine"
  kill $(jobs -p) 2>&1 > /dev/null
  sleep 2 # keeps output cleanish
}

# vim: set ft=sh:
