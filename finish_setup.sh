#!/bin/bash -e

gem install bundler
bundle
compass init rails -r html5-boilerplate -u html5-boilerplate -x sass --force
rails g rspec:install
rails g cucumber:install --rspec --capybara 

for i in $(find app config features spec -type f); do sed -i '' 's/  *$//g' $i; done
sed -i '' "s/^= javascript_include_tag 'rails', 'plugins', 'application'$/= javascript_include_tag :defaults/" app/views/layouts/_javascripts.html.haml
git add .
git status
