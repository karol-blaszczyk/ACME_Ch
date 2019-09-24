FROM ruby:2.6.3

RUN apt-get update -qq \
  && apt-get install -y cron vim build-essential \
  && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
  && apt-get clean autoclean && apt-get autoremove -y \
  && rm -rf /var/lib/apt /var/lib/dpkg /var/lib/cache /var/lib/log

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

ENV BUNDLE_JOBS=4 \
    BUNDLER_VERSION=2.0.2

RUN gem install bundler -v 2.0.2 && \
    gem update --system

RUN bundle install
COPY . /app

