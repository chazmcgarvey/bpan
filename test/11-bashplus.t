#!/usr/bin/env bash

source test/init

if +can uuidgen; then
  is "$(+sym | wc -c | tr -d ' ')" 41 \
    "Generated symbol is 41 chars long"
else
  is "$(+sym | wc -c | tr -d ' ')" 25 \
    "Generated symbol is 41 chars long"
fi

like "$(+sym)" ^sym_ \
  "Generated symbol starts with 'sym_'"

# temp_dir=$(
#   t=$(+mktemp -d)
#   [[ -d $t ]] || exit 1
# )

# is "[[ $temp_dir =~ tmpx ]]" \
#   "Temp dir name looks ok"

done-testing
