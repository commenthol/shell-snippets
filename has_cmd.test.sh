#!/usr/bin/env sh

. ./has_cmd.sh

# returns 0
has_cmd sh
# returns ne 0
has_cmd not_there_cmd
