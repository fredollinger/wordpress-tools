#!/bin/bash

cd /tmp && rm -f salt && lynx -dump https://api.wordpress.org/secret-key/1.1/salt/ > /tmp/salt
cat /tmp/salt
rm -f /tmp/salt
