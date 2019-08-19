#!/bin/bash

func=$1
[ -n $func ] || exit 1
# ファイルが存在する物だけを対象にしたい
[ -f ./src/handler/$func.cr ] || exit 0

docker run --rm -v $(pwd):/src -w /src \
jhass/crystal-build-x86_64 crystal build \
--link-flags -static -o buildfile/$func src/handler/$func.cr && \
chmod +x buildfile/$func