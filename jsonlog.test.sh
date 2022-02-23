#!/usr/bin/env sh

. ./jsonlog.sh

message='this is a message " with a\t quote'
multilineMessage="this is a message\nspanning over\nseveral \"lines\"\nyes"

log_debug "$message"
log_info "$message"

log_error "$multilineMessage"
log_fatal "exiting now"
