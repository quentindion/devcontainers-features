#!/bin/sh

set -e

apk --no-cache add curl

curl -fsSL https://bun.sh/install | bash
