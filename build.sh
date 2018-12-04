func=$1
[ -n $func ] || exit 1
# main.crが存在する物だけを対象にしたい
[ -f $(pwd)/src/$func/main.cr ] || exit 0

docker run --rm -v $(pwd):/src -w /src \
           tjholowaychuk/up-crystal crystal build \
           --link-flags -static -o buildfile/$func src/$func/main.cr && \
chmod +x src/$func