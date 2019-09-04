#!/bin/sh

if test "$(uname -s)" = "Darwin"; then
  gem install jekyll
else
  # probably only need on mac
  # gem install --user-install jekyll
fi

