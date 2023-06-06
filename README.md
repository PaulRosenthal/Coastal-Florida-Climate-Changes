<p align="center"><img src="/img/logo_transparent.png" alt="Sea Florida Change Logo" height="25%" width="25%"></p>

# Sea Florida Change - Northwest Florida Coastal Changes

Welcome to the Sea Florida Change repository; it has been created to help visualize anticipated sea level variance over time.

## Production and Testing Environments

There are two environments associated with this project. The first is the production website that is accessible via [https://SeaFLChange.org](https://SeaFLChange.org). The second is an environment used for development and testing. It is accessible via [test.SeaFLChange.org](https://test.SeaFLChange.org).

The badges below show the status of the most recent continuous integration pipeline runs (used to ensure source code changes do not induce website failures and pass a series of RSpec tests) and test environment build:

[![Continuous Integration Testing Pipeline](https://github.com/PaulRosenthal/Coastal-Florida-Climate-Changes/actions/workflows/CI-Pipeline.yml/badge.svg)](https://github.com/PaulRosenthal/Coastal-Florida-Climate-Changes/actions/workflows/CI-Pipeline.yml)
[![Build and Deploy Pipeline - Test](https://github.com/PaulRosenthal/Coastal-Florida-Climate-Changes/actions/workflows/build-and-deploy-test.yml/badge.svg)](https://github.com/PaulRosenthal/Coastal-Florida-Climate-Changes/actions/workflows/build-and-deploy-test.yml)
[![Build and Deploy Pipeline - Production](https://github.com/PaulRosenthal/Coastal-Florida-Climate-Changes/actions/workflows/build-and-deploy-production.yml/badge.svg)](https://github.com/PaulRosenthal/Coastal-Florida-Climate-Changes/actions/workflows/build-and-deploy-production.yml)

## Website Architecture

The Sea Florida Change website is hosted using Google Cloud Run. Jekyll is used to create the static content for the website. Google Cloud Run uses a Docker container with the site's static content and NGINX for traffic management. The Dockerfile, NGINX configuration, and GitHub Actions workflows for build and deployment are all stored within this repository.

## Feedback or Contributions

I hope you find this site useful, and I would be happy to incorporate any feedback you might have. If you would like to contribute directly, please open a pull request to merge changes into the `test` branch. When the pull request is approved, the test environment will automatically re-deploy with the changes.
