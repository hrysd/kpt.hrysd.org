FROM ruby:2.6.6-buster

COPY --from=node:14.4.0-buster /usr/local /usr/local
COPY --from=node:14.4.0-buster /opt /opt

RUN apt-get update -qq && apt-get install -y postgresql-client
RUN useradd -mU --uid 1000 rails

ENV APP_PATH=/usr/src/app
ENV BUNDLE_PATH=/usr/src/app/vendor/bundle
ENV NODE_MODULES_PATH=/usr/src/app/node_modules

RUN mkdir -p ${APP_PATH} ${BUNDLE_PATH} ${NODE_MODULES_PATH}
RUN chown -R rails:rails ${APP_PATH} ${BUNDLE_PATH} ${NODE_MODULES_PATH}

WORKDIR ${APP_PATH}

USER rails
