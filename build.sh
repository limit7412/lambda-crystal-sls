docker run --rm -v $(pwd):/src -w /src \
           tjholowaychuk/up-crystal crystal build \
           --link-flags -static -o buildfile/hello_crystal src/hello_crystal.cr &&\
sls deploy