#!/usr/bin/env bats

load "$BATS_PATH/load.bash"

@test "No whitelist arg given" {
  run $PWD/check-plugins
  
  assert_output --partial "Usage"
  assert_failure
}

@test "Invalid whitelist path given" {
  run $PWD/check-plugins /invalid/checklist/path.txt
  
  assert_output --partial "/invalid/checklist/path.txt does not exist"
  assert_failure
}