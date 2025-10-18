#!/usr/bin/env bash
dir="${ZDOTDIR:-$HOME}/.antidote"

if [ ! -d "$dir" ] || [ -z "$(ls -A "$dir" 2>/dev/null)" ]; then
  git clone --depth=1 https://github.com/mattmc3/antidote.git "$dir"
fi
