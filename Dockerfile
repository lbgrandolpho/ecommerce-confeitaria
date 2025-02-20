FROM ruby:3.2

WORKDIR /app

RUN apt-get update -qq && apt-get install -y nodejs npm postgresql-client

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

COPY . .

EXPOSE 3000

ENTRYPOINT ["./scripts/entrypoint.sh"]
