#!/bin/bash

if [ -z "$1" ]; then
  export AWS_PROFILE=$1
fi

# Copy the build into bucket and delete all existing files
aws s3 sync ./build s3://kurssim.me \
  --region eu-central-1 \
  --acl public-read \
  --cache-control max-age=2592000 \
  --delete

# Copy index.html the second time with decreased cache duration
aws s3 cp ./build/index.html s3://kurssim.me \
  --region eu-central-1 \
  --acl public-read \
  --cache-control max-age=120