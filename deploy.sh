#!/bin/bash

mkdir -p public/conference && cd public/conference || exit

awk 1 `find ../../conference -name '*.yml' -not -path '**/types.yml'` > allconf.yml

cp ../../conference/types.yml .

cd ../..