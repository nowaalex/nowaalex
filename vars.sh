#!/bin/bash

ORIG_DIR="$(pwd)"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_ARCHIVE="$SCRIPT_DIR/home_backup.tar.bz2"
ROOT_ARCHIVE="$SCRIPT_DIR/root_backup.tar.bz2"
