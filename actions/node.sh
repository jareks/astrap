#!/bin/bash

set -xe

npm config set prefix $HOME/npm_packages
npm install -g typescript-language-server typescript
