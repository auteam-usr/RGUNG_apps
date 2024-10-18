#!/bin/bash

groupdel -f testgroup

userdel -rf testuser

rm -f /home/user/testing/red.txt

rm -f /home/user/testing/file17.txt

rm -f /home/user/testing/file{1..7}.txt

rm -f /home/user/testing/archive.zip

rm -f /home/user/testing/archive.tar

rm -f /home/user/testing/test.txt

rm -f /home/user/testing/test1.txt

rmdir /home/user/testing
