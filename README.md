# About

Blizzard is the official demonstration project for how to structure a Winter CMS project. It makes use of every Winter CMS first party plugin and theme to demonstrate how to use them in a real world application.

It will always be a work in progress, and will be updated as new features are added to Winter CMS.

## Contributing

All development should be done locally using [Homestead](https://laravel.com/docs/8.x/homestead) or any other local development environment.

Pushes to main are automatically deployed on the [production server](https://blizzard.wintercms.com/).

### Setup

1. Clone the repo
2. Copy .env.example to .env and configure accordingly (APP_URL, DB credentials, and APP_KEY (run `php artisan key:generate`))
3. Install dependencies with `composer install`
4. Install node dependencies with `npm install`
5. Run migrations to initialize your database with `php artisan winter:up`
6. Set the current version of Winter CMS for cache busting `php artisan winter:version`

> **NOTE**: If using the scheduler; ensure that the scheduler is properly configured by following https://wintercms.com/docs/setup/installation#crontab-setup (add `* * * * * php /path/to/artisan schedule:run >> /dev/null 2>&1` to the crontab)
