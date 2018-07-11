#!/usr/bin/env bats

load "$BATS_PATH/load.bash"

@test "Disallows bad plugins" {
  run \
    env BUILDKITE_PLUGINS='[{"github.com/buildkite-plugins/invalid-buildkite-plugins":null}]' \
    "$PWD/check-plugins" "$PWD/tests/whitelist.txt"

  assert_output --partial "Plugin not allowed"
  assert_failure
}

@test "Disallows plugins without version pins" {
  run \
    env BUILDKITE_PLUGINS='[{"github.com/buildkite-plugins/docker-compose-buildkite-plugins":null}]' \
    "$PWD/check-plugins" "$PWD/tests/whitelist.txt"

  assert_output --partial "Plugin not allowed"
  assert_failure
}