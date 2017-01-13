#!/usr/bin/env bash

rbenv install 2.4.0
rbenv rehash
rbenv global 2.4.0
gem install bundler
rbenv version
gem env home
