Actions Taken:

`composer create-project wintercms/winter blizzard.wintercms.com dev-develop`

- Edited `composer.json` to update project information and add dev dependencies
    - debugbar, dusk, ignition, ray, sentry
    - run `composer update` to install dev dependencies
    - ran `artisan winter:env` to generate an initial `.env` file
    - added and tweaked `.env` variables then copied and pasted into `.env.example`
- Edited `.github` folder
    - Removed `.github/assets/Github Banner.png`
    - Edited `.github/ISSUE_TEMPLATE` to be project-specific
    - Edited `.github/workflows`
        - Removed `utilities/library-switcher`
        - Removed `subsplit.yml`
        - Edited `code-quality.yml` & `tests.yml` to remove the branch switching
- Deleted `.gitpod` folder
- Deleted `plugins/winter/demo`
- Deleted `themes/demo`
- Edited `.gitignore`
    - add the `modules` folder
    - add folders for plugins loaded via composer
    - remove `composer.lock`, it should be tracked for individual projects
- Deleted `.gitpod.yml`
- Deleted `CHANGELOG.md`
- Ran `artisan completion bash >> ./.scripts/completion.sh` to generate the completion script that can be sourced with `source /.scripts/completion.sh` in order to enable autocompletion for artisan commands
- Added `/.scripts/deploy.sh` deployment script that runs in atomic deployment environments
- Edited `LICENSE.md` to update project information
- Edited `package.json` to move core modules & composer-loaded plugins to the ignoredPackages
- Edited `phpunit.xml` to remove the core test suite
- Edited `README.md` to update project information

Actions to Take:
- Add project specific plugins
    - Add to composer.json
    - Run composer update
    - Run `artisan mix:install` and ignore all the packages loaded via composer

- Change config files
    - config/app.php (app name)