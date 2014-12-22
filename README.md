d7-project
==========

Template for starting a new Drupal 7 project where you have custom modules tracked in git.

## How to get started

0. Install [composer](https://getcomposer.org).  Run `composer --version` to
verify that it works.  On Mac OS X `brew install composer` is usually the
most conveinient way to make sure it's available.

1. Clone this repo

2. Edit `drupal.make` to include the required modules.

3. Run `bin/setup`.  This will create the `drupal` and `site` directory.

4. Run `bin/runserver` and visit <http://localhost:8010>.  You should now 
see the Drupal installation wizard.  Fill in the information it requires
and you should see your brand new empty site.

5. Configure your site and create content.

6. Profit!

## Layout

This section explains the layout of this Drupal 7 project.

- bin/
- composer.json
- drupal/
- drupal.make
- etc/
- Makefile
- modules/
- scripts/
- site/
- theme/
- vendor/

## How to add a custom module

Try this:

    $ mkdir -p modules/foo
    $ echo "name = Foo" >modules/foo/foo.info
    $ echo "core = 7.x" >>modules/foo/foo.info
    $ touch modules/foo/foo.module
    $ bin/site-drush pm-enable foo

## How to add a contrib module

1. Edit `drupal.make` to include the source for the required module

2. Remove the `drupal` directory and run `bin/setup` again.

3. Run `bin/site-drush pm-enable <module>`.

4. Test it

5. Run `git commit drupal.make`.

This procedure ensures that `drupal.make` accurately describes the required
software.  If you just want to play with the latest versions of a module you
can also install it by running `bin/site-drush pm-enable` directly, but in that
case the module would disappear when the `drupal` directory is rebuilt.

## Commands

### runserver

Serve the site using PHP's builtin web server.
This is an zero-fuzz alternative to configuring Apache to serve the `drupal` directory.
Ctrl-C to abort.  Run it as:

    $ bin/runserver

Once the site is configured an alternative is the drush server which can be started with:

    $ bin/site-drush rs

### site-drush

Run `drush` picking up the correct site and with knowledge about the correct site URL.
For instance:

    $ bin/site-drush pml

to see what modules are installed.
