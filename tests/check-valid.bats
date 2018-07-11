#!/usr/bin/env bats

load "$BATS_PATH/load.bash"

@test "Allows missing list of plugins (no plugins)" {
  run \
    "$PWD/check-plugins" "$PWD/tests/whitelist.txt"

  assert_output --partial "BUILDKITE_PLUGINS is unset"
  assert_success
}

@test "Allows valid plugins (single plugin, no config)" {
  run \
    env BUILDKITE_PLUGINS='[{"github.com/buildkite-plugins/docker-compose-buildkite-plugin#v1.6.0":null}]' \
    "$PWD/check-plugins" "$PWD/tests/whitelist.txt"

  assert_output --partial "All plugins are allowed"
  assert_success
}

@test "Allows valid plugins (single plugin, with config)" {
  run \
    env BUILDKITE_PLUGINS='[{"github.com/buildkite-plugins/docker-compose-buildkite-plugin#v1.6.0":{"run":"app","config":".buildkite/docker-compose.yml"}}]' \
    "$PWD/check-plugins" "$PWD/tests/whitelist.txt"

  assert_output --partial "All plugins are allowed"
  assert_success
}

@test "Allows valid plugins (multiple plugins)" {
  run \
    env BUILDKITE_PLUGINS='[{"github.com/buildkite-plugins/docker-compose-buildkite-plugin#v1.6.0":null}, {"github.com/my-org/my-buildkite-plugin#v1.0.0":null}]' \
    "$PWD/check-plugins" "$PWD/tests/whitelist.txt"

  assert_output --partial "All plugins are allowed"
  assert_success
}

@test "Allows valid plugins (multiple same plugins)" {
  run \
    env BUILDKITE_PLUGINS='[{"github.com/buildkite-plugins/docker-compose-buildkite-plugin#v1.6.0":null}, {"github.com/buildkite-plugins/docker-compose-buildkite-plugin#v1.6.0":null}]' \
    "$PWD/check-plugins" "$PWD/tests/whitelist.txt"

  assert_output --partial "All plugins are allowed"
  assert_success
}
