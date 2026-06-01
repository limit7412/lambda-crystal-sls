# =====================================================================
# Docker(ECR イメージ)版の Dockerfile【旧構成・参考用にコメントアウト】
# ---------------------------------------------------------------------
# zip(provided.al2)版へ移行したため未使用。
# zip 版では serverless.yml の scripts フックが crystallang/crystal イメージで
# `crystal build --link-flags -static -o bootstrap src/main.cr` を実行して
# bootstrap を生成するため、この Dockerfile は不要になった。
# ---------------------------------------------------------------------
# FROM crystallang/crystal:latest as build-image
#
# WORKDIR /work
# COPY ./ ./
#
# RUN crystal build --link-flags -static -o bootstrap src/main.cr
# RUN chmod +x bootstrap
#
# FROM public.ecr.aws/lambda/provided:latest
#
# COPY --from=build-image /work/bootstrap /var/runtime/
#
# CMD ["dummyHandler"]
# =====================================================================
