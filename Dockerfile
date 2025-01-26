# Base Dockerfile components/structure 
# courtesy of https://www.deepanseeralan.com/tech/hosting-jekyll-site-in-gcp-cloud-run/. 
 
# Use the latest Ruby Docker container and refer to it as "jekyll-website-build" 
# downstream: 
# Note: Version 3.3.6 has been temporarily pinned because of an issue with Jekyll and Ruby 3.4.
FROM ruby:3.3.6 as jekyll-website-build 
 
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

# An alpine container is created to build the flag status viewer:
FROM node:alpine AS flag_status_viewer_builder

# Set the working directory:
WORKDIR /flag-status-viewer

# Copy the package.json and package-lock.json files:
COPY /flag_status_viewer/package*.json ./

# Install npm dependencies:
RUN npm install

# Copy the remaining files:
COPY ./flag_status_viewer .

# Build the flag status viewer application:
RUN npm run build

 
# An nginx container is created to serve the website: 
FROM nginx 
 
# The website files now reside in /build-directory/_site in the 
# jekyll-website-build container and /build in the flag_status_viewer_builder container. 
# They are transferred to /usr/share/nginx/html and /usr/share/nginx/html/flag_status_viewer: 
COPY --from=jekyll-website-build  /build-directory/_site /usr/share/nginx/html
COPY --from=flag_status_viewer_builder /flag-status-viewer/build /usr/share/nginx/html/flag-status-viewer

# Testing:
RUN echo "Contents of /usr/share/nginx/html:":
RUN cd /usr/share/nginx/html/ && ls
RUN echo "Contents of /usr/share/nginx/html/flag-status-viewer:"
RUN cd /usr/share/nginx/html/flag-status-viewer && ls
 
# Finally, the the main nginx.conf file is transferred to
# /etc/nginx.conf.d/nginx.conf. The Sea Florida Change
# server configuration is transferred to /etc/nginx/conf.d/seaflchange.org.conf.
COPY /nginx.conf /etc/nginx/nginx.conf
COPY /seaflchange.org.conf /etc/nginx/conf.d/seaflchange.org.conf
