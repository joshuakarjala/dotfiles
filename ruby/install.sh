#!/bin/sh

if test "$(uname -s)" = "Darwin"; then
  gem install jekyll
else
  gem install --user-install jekyll
fi

