#!/bin/bash
echo This shell will generate short url
echo -n "Please input original url:";
read url
echo -n "Please input code:"
read code
curl -i https://git.io -F "url=$url" -F "code=$code"
