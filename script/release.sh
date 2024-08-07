#!/usr/bin/env bash

# Check that the database is setup already.
# If not, it means this release command is running on a Review App prior to the first postdeploy.
# In that case, we must skip the migration and do it in postdeploy step

# This command should return 0 on properly setup DB
psql $DATABASE_URL -c 'SELECT name FROM muni_types LIMIT 1'

if [ $? == 0 ]; then
  echo "Running Rails DB migrations..."
  bundle exec rails db:migrate && echo "migrations complete"
  echo "Running Rails DB seeds..."
  bundle exec rails db:seed && echo "seeds complete"
else
  echo 'Skipping Rails DB migrations!!'
  echo 'If this is happening outside review app provisioning something went wrong!'
fi
