#!/bin/bash

# Make the storage directories if they don't already exsit
mkdir -p $SHARED/storage/app/media &&
mkdir -p $SHARED/storage/app/resized &&
mkdir -p $SHARED/storage/app/uploads/public &&
mkdir -p $SHARED/storage/cms/cache &&
mkdir -p $SHARED/storage/cms/combiner &&
mkdir -p $SHARED/storage/cms/twig &&
mkdir -p $SHARED/storage/framework/cache &&
mkdir -p $SHARED/storage/framework/sessions &&
mkdir -p $SHARED/storage/framework/views &&
mkdir -p $SHARED/storage/temp/public &&
mkdir -p $SHARED/storage/logs &&
mkdir -p $SHARED/storage/temp/public;

# Remove the current storage directory
rm -rf $RELEASE/storage

# Link the application storage directory to this
ln -s $SHARED/storage $RELEASE/storage

# Install dependencies from composer.lock - add --no-dev for staging & production environments
echo "Installing dependencies from composer.lock"
composer install --no-dev

# Trigger Laravel package discovery
echo "Discovering packages"
php artisan package:discover

# Enable maintenance mode
echo "Enabling maintenance mode"
php artisan down

# Run any pending migrations
echo "Running pending migrations"
php artisan winter:up

# Set the winter version for cache busting
echo "Setting winter version"
php artisan winter:version
echo "Clearing cache"
php artisan cache:clear

# Remove and regenerate the symlinked public directory for whitelist approach to clean out
# any references that may have been removed and add any new ones that may have been added
echo "Removing and regenerating the symlinked public directory"
rm -rf $RELEASE/public
php artisan winter:mirror public --relative

# Disable maintenance mode
echo "Disabling maintenance mode"
php artisan up