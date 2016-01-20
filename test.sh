#!/bin/bash

pip install --upgrade awscli
ECR_LOGIN=`aws ecr get-login --region us-east-1`
$ECR_LOGIN

TEST_DIR=`pwd`

#ecr_test/ruby_parent
cd $TEST_DIR/parent
docker build -t ecr_test/ruby_parent .
docker tag ecr_test/ruby_parent:latest 231879086156.dkr.ecr.us-east-1.amazonaws.com/ecr_test/ruby_parent:latest
docker push 231879086156.dkr.ecr.us-east-1.amazonaws.com/ecr_test/ruby_parent:latest

#ecr_test/ruby_child
cd $TEST_DIR/child
docker build -t ecr_test/ruby_child .
docker tag ecr_test/ruby_child:latest 231879086156.dkr.ecr.us-east-1.amazonaws.com/ecr_test/ruby_child:latest
docker push 231879086156.dkr.ecr.us-east-1.amazonaws.com/ecr_test/ruby_child:latest

