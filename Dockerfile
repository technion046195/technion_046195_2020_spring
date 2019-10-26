FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y \
        ruby-full \
        build-essential \
        zlib1g-dev \
        locales \
        && \
    rm -rf /var/lib/apt/lists/*
RUN gem install bundler

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8  

COPY /Gemfile /app/Gemfile
COPY /Gemfile.lock /app/Gemfile.lock
WORKDIR /app
RUN bundle install

CMD bundle exec jekyll serve -d /tmp/site -P 4444 --livereload --host=0.0.0.0