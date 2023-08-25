#!/bin/bash

run_lint() {
  shellcheck ./"$1"
}

run_lint pueue_update_pip_packages.sh
run_lint update_pip_packages.sh
run_lint utils/format.sh
run_lint utils/install.sh
run_lint utils/lint.sh
