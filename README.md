# Buildkite Plugin Whitelisting Example

An example script for performing Buildkite Plugin whitelisting using the `BUILDKITE_PLUGINS` JSON environment variable, and an agent environment hook. ⚠️ This is an example only, and should be independently tested and verified before being used in production.

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
