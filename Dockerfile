FROM ruby:3.0.6-bullseye

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  yarn \
  && rm -rf /var/lib/apt/lists/*

# Creating a directory for our application
RUN mkdir /usr/src/app

# Setting the created directory as the working directory
WORKDIR /usr/src/app

# Copying the Gemfile and Gemfile.lock into the image
COPY Gemfile Gemfile.lock ./

# Installing foreman
RUN gem install foreman

# Installing the gems
RUN bundle install

# Copying the application code into the image
COPY . .

# Exposing the port that our application will run on
EXPOSE 3000:3000

CMD [ "bin/dev" ]
