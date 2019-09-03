FROM ruby:2.5.0

ARG RAILS_ENV=production
ENV RAILS_ENV=${RAILS_ENV}
ENV APP_ROOT=/app
ENV TZ=Asia/Tokyo
RUN echo "${TZ}" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

WORKDIR ${APP_ROOT}
COPY Gemfile Gemfile.lock ./
RUN bundle install
RUN apt-get update && apt-get install -y default-mysql-client
COPY . .

CMD ["bundle", "exec", "rails", "s"]
