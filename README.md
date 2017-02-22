
[![Build Status](https://travis-ci.org/xendk/ede-php-autoload-composer-installers.svg?branch=master)](https://travis-ci.org/xendk/ede-php-autoload-composer-installers)
[![MELPA Stable](https://stable.melpa.org/packages/ede-php-autoload-composer-installers-badge.svg)](https://stable.melpa.org/#/ede-php-autoload-composer-installers)
[![MELPA](https://melpa.org/packages/ede-php-autoload-composer-installers-badge.svg)](https://melpa.org/#/ede-php-autoload-composer-installers)

# ede-php-autoload-composer-installers

## Description

This project adds support for [composer/installers][]
to [ede-php-autolaod][], allowing it to locate classes even when
composer has relocated the package.

Customize `ede-php-autoload-composer-installers-project-paths` to
define the default installation paths for project types. For instance,
for `drupal-module` this would be `modules/{$name}`.

`ede-php-autoload-composer-installers` will throw a warning if a
project was encountered with a type not:

1. Found in `ede-php-autoload-composer-installers-project-paths`.
2. Specified in `installer-paths` in the `extra` section of
   `composer.json`
3. Found in the default `vendor/{$vendor}/{$name}` location.

[composer/installers]: https://github.com/composer/installers
[ede-php-autolaod]: https://github.com/stevenremot/ede-php-autoload/

## Outstanding issues

Currently `ede-php-autoload-composer-installers` does not support
munging of the package name nor `installer-name` in the project.
Comment on the issues (#2, #3) if you need it, and I'll make it a
priority to fix.

## License

This project is released under the GPL v3 license. See `GPL` for
details.

