# Base Dockerfile components/structure
# courtesy of https://www.deepanseeralan.com/tech/hosting-jekyll-site-in-gcp-cloud-run/.

# Use the latest Ruby Docker container and refer to it as "jekyll-website-build"
# downstream:
FROM ruby as jekyll-website-build

# Install Bundler for retrieving and loading dependencies downstream:
RUN gem install bundler

# Set the working directory for subsequent
# RUN, CMD, ADD, COPY and ENTRYPOINT commands:
WORKDIR /build-directory

# Transfer the Gemfile to the build directory and
# install gem dependencies:
COPY Gemfile* /build-directory/
RUN bundle install

# Take the root contents (with the repository files necessary)
# to generate the website and copy them to the build-directory:
COPY . .

# Set environment build variables and create the static website content:
ENV JEKYLL_ENV=production
RUN bundle exec jekyll build

# An nginx container is created to serve the website:
FROM nginx

# The website files now reside in /build-directory/_site in the
# jekyll-website-build container. They are transferred to
# /usr/share/nginx/html:
COPY --from=jekyll-website-build  /build-directory/_site /usr/share/nginx/html

# Finally, the the nginx.conf file is transferred to
# /etc/nginx.conf.d/default.conf:
COPY /nginx.conf /etc/nginx/conf.d/default.conf