#!/usr/bin/env zsh

set -o errexit -o nounset -o pipefail

brew update && brew cask install chefdk

berks vendor cookbooks
berks install

# run Chef cookbooks
chef-client --config client.rb -z -o mac
