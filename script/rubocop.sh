#!/bin/bash
git diff --name-only --diff-filter=d develop | awk /[^db/schema].+[^e]rb$/ | xargs bundle exec rubocop -A
