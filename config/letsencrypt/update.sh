#!/bin/sh

LVEE_CURRENT_DIR="$(cd "$(dirname "$0")" && pwd -P)"
LVEE_UPDATE_DIR="$LVEE_CURRENT_DIR/update/"

for f in $(ls "$LVEE_UPDATE_DIR"); do
    "$LVEE_UPDATE_DIR$f"
done
