#!/usr/bin/env sh
# ---
# @credits https://stackoverflow.com/questions/2683279/how-to-detect-if-a-script-is-being-sourced

is_sourced() {
	if [ -n "$ZSH_VERSION" ]; then
		case $ZSH_EVAL_CONTEXT in *:file:*) return 0;; esac
	else  # Add additional POSIX-compatible shell names here, if needed.
		case ${SHELL##*/} in dash|-dash|bash|-bash|ksh|-ksh|sh|-sh) return 0;; esac
	fi
	return 1  # NOT sourced.
}
