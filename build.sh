func=$1
[ -n $func ] || exit 1

docker run --rm -v $(pwd):/src -w /src \
           tjholowaychuk/up-crystal crystal build \
           --link-flags -static -o buildfile/$func src/$func/main.cr && \
chmod +x src/$func