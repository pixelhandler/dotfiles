#!/usr/bin/env bash

rbenv install 2.4.3
rbenv rehash
rbenv global 2.4.3
gem install bundler
rbenv version
gem env home

