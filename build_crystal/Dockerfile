FROM lambci/lambda:build-nodejs8.10

ADD . /build_crystal

RUN rpm --import http://dist.crystal-lang.org/rpm/RPM-GPG-KEY
RUN cat /build_crystal/heredoc.txt > /etc/yum.repos.d/crystal.repo
RUN yum -y install crystal | true
RUN crystal -v

WORKDIR /buildfile
CMD ["crystal","build","/src/hello_crystal.cr"]
# CMD ["crystal","build","/src/hello_crystal.cr","--release"]
# CMD ["crystal","build","/src/hello_crystal.cr","--cross-compile","'Linux x86_64'","--target","'x86_64-unknown-linux-gnu'"]

# ENTRYPOINT [ "/bin/bash" ]