# Buildkite Allowed Plugins Hooks Example

An example script for enforcing an allowed list of Buildkite Plugins in a [Buildkite Agent Hook](https://buildkite.com/docs/agent/v3/hooks), by checking the `BUILDKITE_PLUGINS` JSON environment variable. ⚠️ This is an example only, and should be independently tested and verified before being used in production.

Agent machine requirements:

* Bash
* jq

## Usage

See [check-plugins](check-plugins)

## Developing

Use the following to run the tests:

```bash
docker-compose run --rm tests
```
