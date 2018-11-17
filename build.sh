docker run --rm -v $(pwd):/src -w /src \
           tjholowaychuk/up-crystal crystal build \
           --link-flags -static -o buildfile/main src/main.cr &&\
sls deploy