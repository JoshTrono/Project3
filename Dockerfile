FROM ruby:3.2.1

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN gem install bundler -v 2.4.9 && bundle install

COPY . .

EXPOSE 3000

CMD ["rails", "db:create", "environment", "development"]

CMD ["bundle","exec","rails", "server", "-b", "0.0.0.0", "-p", "3000"]