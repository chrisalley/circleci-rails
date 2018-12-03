FROM ruby:2.3.0

RUN apt-get update && apt-get upgrade -y && apt-get install -y \ 
  build-essential \ 
  nodejs

RUN mkdir -p /app
WORKDIR /app

COPY ["Gemfile", "Gemfile.lock", "/app/"]

RUN bundle install --jobs=`cat /proc/cpuinfo | grep processor | wc -l`

COPY [".", "/app"]
