#!/usr/bin/env bash

# ssh-keygen -t rsa -b 4096 -C "me@example.com"

eval "$(ssh-agent -s)"
ssh-add -K