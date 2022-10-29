#!/usr/bin/env sh
set -e

cd /home/app
bundle install
rm -rf tmp
rails db:create
rails db:migrate
rails s -b 0.0.0.0
# tail -F anything
