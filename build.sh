rpm --import http://dist.crystal-lang.org/rpm/RPM-GPG-KEY
cat /build_crystal/heredoc.txt > /etc/yum.repos.d/crystal.repo
yum -y install crystal | true
crystal /src/hello_crystal.cr