#!/usr/bin/env bash

set -euo pipefail

cd src/

gunicorn aprod:APP
