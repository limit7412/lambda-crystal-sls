FROM lambci/lambda:build-nodejs8.10

ADD . /build_elixir

RUN yum update
RUN yum -y install erlang | true

RUN git clone https://github.com/elixir-lang/elixir.git
WORKDIR ./elixir
RUN make clean test
RUN echo "PATH=\$PATH:$(pwd)/bin" >> ~/.bashrc
RUN source ~/.bashrc

WORKDIR /buildfile
CMD ["elixir","-v"]
# CMD ["elixir","./src/hello_elixir"]
# CMD ["elixirc","./src/hello_elixir"]