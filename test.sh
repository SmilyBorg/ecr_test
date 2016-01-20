#!/bin/bash

aws ecr get-login --region us-east-1 
TEST_DIR=`pwd`

#ecr_test/ruby_parent
cd $pwd/parent/
docker build -t ecr_test/ruby_parent .
docker tag ecr_test/ruby_parent:latest 231879086156.dkr.ecr.us-east-1.amazonaws.com/ecr_test/ruby_parent:latest
docker push 231879086156.dkr.ecr.us-east-1.amazonaws.com/ecr_test/ruby_parent:latest

#ecr_test/ruby_child
cd $pwd/child
docker build -t ecr_test/ruby_child .
docker tag ecr_test/ruby_child:latest 231879086156.dkr.ecr.us-east-1.amazonaws.com/ecr_test/ruby_child:latest
docker push 231879086156.dkr.ecr.us-east-1.amazonaws.com/ecr_test/ruby_child:latest
