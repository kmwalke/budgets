#!/bin/bash
git diff --name-only --diff-filter=d develop | awk /.+[^e]rb$/ | xargs bundle exec rubocop -A
