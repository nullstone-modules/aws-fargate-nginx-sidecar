# Fargate Nginx Sidecar

This module provides a Docker-friendly mechanism for serving a web application's assets through nginx.

## Why?

Typically, an Nginx server is added to a VM when hosting web applications to server static assets efficiently.
This process runs beside a process that serves dynamic content. (e.g. Ruby on Rails, Laravel, PHP, etc.)
However, Docker prefers to have only one process running in the container.

The "Docker" way of solving this problem is through the use of a sidecar.
A sidecar deploys with the primary application container.
In this case, the sidecar is an Nginx server that intercepts requests.
The Nginx server serves public assets directly and forwards all other requests to the application.

## What does my app image need?

This capability expects your deployed application Docker image to have files in the following locations:

#### Public Assets
`/app/public/`

Place your application's public assets (images, javascript, etc.) in this directory.

#### Nginx Templates
`/etc/nginx/templates/`

This contains nginx configuration template files. 
Template files allow you to build nginx configuration files that will interpolate environment variables when the process starts.
The results of these files will be placed into the Nginx Configuration

NOTE: This sidecar requires an nginx template or nginx configuration to work properly.

#### Nginx Configuration
`/etc/nginx/conf.d/`

This contains nginx configuration files.

NOTE: This sidecar requires an nginx template or nginx configuration to work properly.
