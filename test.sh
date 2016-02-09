#!/bin/bash

PATH=$PATH:/usr/local/bin:/usr/local/sbin

#pip install --upgrade awscli
ECR_LOGIN=`aws ecr get-login --region us-east-1`
$ECR_LOGIN

TEST_DIR=`pwd`

echo
echo ----------------------------------
echo ecr_test/ruby_parent:bob

#ecr_test/ruby_parent
cd $TEST_DIR/ecr/parent
docker build -t 231879086156.dkr.ecr.us-east-1.amazonaws.com/ecr_test/ruby_parent:bob .
#docker tag ecr_test/ruby_parent:latest 231879086156.dkr.ecr.us-east-1.amazonaws.com/ecr_test/ruby_parent:bob
docker push 231879086156.dkr.ecr.us-east-1.amazonaws.com/ecr_test/ruby_parent:bob

echo
echo ----------------------------------
echo ecr_test/ruby_child:bob

#ecr_test/ruby_child
cd $TEST_DIR/ecr/child
docker build -t 231879086156.dkr.ecr.us-east-1.amazonaws.com/ecr_test/ruby_child:bob .
#docker tag ecr_test/ruby_child:latest 231879086156.dkr.ecr.us-east-1.amazonaws.com/ecr_test/ruby_child:bob
docker push 231879086156.dkr.ecr.us-east-1.amazonaws.com/ecr_test/ruby_child:bob

echo
echo ----------------------------------
echo ecr_test/ruby_child:sam

#ecr_test/ruby_child
cd $TEST_DIR/ecr/child/sam/
docker build -t 231879086156.dkr.ecr.us-east-1.amazonaws.com/ecr_test/ruby_child:sam .
#docker tag ecr_test/ruby_child:latest 231879086156.dkr.ecr.us-east-1.amazonaws.com/ecr_test/ruby_child:bob
docker push 231879086156.dkr.ecr.us-east-1.amazonaws.com/ecr_test/ruby_child:sam

echo
echo ----------------------------------
echo smilyborg/ruby_parent:bob

#dockerhub/ruby_parent
cd $TEST_DIR/dockerhub/parent
docker build -t smilyborg/ruby_parent:bob .
#docker tag ecr_test/ruby_parent:latest 231879086156.dkr.ecr.us-east-1.amazonaws.com/ecr_test/ruby_parent:latest
docker push smilyborg/ruby_parent:bob

echo
echo ----------------------------------
echo smilyborg/ruby_child:bob

#ecr_test/ruby_child
cd $TEST_DIR/dockerhub/child
docker build -t smilyborg/ruby_child:bob .
#docker tag ecr_test/ruby_child:latest 231879086156.dkr.ecr.us-east-1.amazonaws.com/ecr_test/ruby_child:latest
docker push smilyborg/ruby_child:bob

echo
echo ----------------------------------
echo smilyborg/ruby_child:sam

#ecr_test/ruby_child
cd $TEST_DIR/dockerhub/child/sam/
docker build -t smilyborg/ruby_child:sam .
#docker tag ecr_test/ruby_child:latest 231879086156.dkr.ecr.us-east-1.amazonaws.com/ecr_test/ruby_child:latest
docker push smilyborg/ruby_child:sam 

echo
echo ----------------------------------
echo
