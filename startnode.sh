#!/bin/sh
dockerize -wait tcp://mysql:3306 -timeout 20s npm install
# tsc
npm run start:dev