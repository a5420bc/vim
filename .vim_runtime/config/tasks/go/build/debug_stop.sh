#! /bin/bash
ps aux|grep dlv |grep -v grep |awk '{print $2}' | xargs kill -9
