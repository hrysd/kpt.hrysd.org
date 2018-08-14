FROM ruby

COPY --from=node /usr/local /usr/local
COPY --from=node /opt /opt

ENV APP_DIR=/kpt \
  USER_NAME=kpt \
  LANG=C.UTF-8

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN useradd --create-home --user-group --uid 1000 $USER_NAME
RUN mkdir $APP_DIR
RUN chown -R kpt /kpt

# ...
RUN chown -R kpt vendor/bundle
WORKDIR $APP_DIR
USER $USER_NAME

ENV BUNDLE_PATH vendor/bundle
