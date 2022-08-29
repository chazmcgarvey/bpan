#!/usr/bin/env bash

source test/init

online ||
  skip-all "These tests need to be run online"

{
  test-install-setup
  cmd='bpan -q install prelude-bash'
  ok "$($cmd)" \
    "'$cmd' works"
  ok-d "$I/src/bpan-org/prelude-bash/"
  ok-l "$I/lib/prelude.bash"
  ok-f "$I/lib/prelude.bash"
  ok-l "$I/man/man3/prelude.3"
  ok-f "$I/man/man3/prelude.3"
}

{
  test-install-setup
  cmd='bpan -q install github:bpan-org/prelude-bash=0.1.0'
  ok "$($cmd)" \
    "'$cmd' works"
  ok-d "$I/src/bpan-org/prelude-bash/0.1.0/"
  ok-l "$I/lib/prelude.bash"
  ok-f "$I/lib/prelude.bash"
  ok-l "$I/man/man3/prelude.3"
  ok-f "$I/man/man3/prelude.3"

  note "Testing 'bpan uninstall' here since we have something to uninstall"

  cmd=${cmd/install/uninstall}
  ok "$($cmd)" \
    "'$cmd' works"
  ok-not-e "$I/src/bpan-org/prelude-bash/0.1.0/"
  ok-not-e "$I/lib/prelude.bash"
  ok-not-e "$I/man/man3/prelude.3"

  is "$(cd "$BPAN_INSTALL" && find . -mindepth 1)" \
    "./index.ini" \
    "Install directory is empty"
}

done-testing