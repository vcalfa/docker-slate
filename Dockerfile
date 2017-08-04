FROM ruby:2.3.1-slim

RUN apt-get update
RUN apt-get install -yq ruby ruby-dev build-essential nodejs rsync git openssh-client

# installs bundler
RUN gem install --no-ri --no-rdoc bundler
ADD slate/ /app
RUN cd /app; bundle install
EXPOSE 4567
WORKDIR /app

ONBUILD RUN rm -fr /app/source


CMD ["/bin/bash"]
ENTRYPOINT []
