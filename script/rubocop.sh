#!/bin/bash
reset
git diff --name-only HEAD develop | awk /.+[^e]rb$/ | xargs bundle exec rubocop -A
