# UI tests

```
composer install
```

## Prerequisites for running UI acceptance tests

The UI acceptance tests use [Selenium WebDriver](http://www.seleniumhq.org/projects/webdriver/), and at the time of writing, we need Selenium Standalone Server 2.53 and Firefox 46 to be able to run the tests.

Install Firefox 46.0.1 for testing (on macOS):

```
mkdir -p $HOME/.firefox/46.0.1
cd $HOME/.firefox/46.0.1
curl https://ftp.mozilla.org/pub/firefox/releases/46.0.1/mac/en-US/Firefox%2046.0.1.dmg > Firefox.dmg
hdiutil mount Firefox.dmg
cp -Rv /Volumes/Firefox/Firefox.app .
hdiutil unmount /Volumes/Firefox
rm Firefox.dmg
cd -
```

Download Selenium server:

```
mkdir -p $HOME/.selenium
curl --output $HOME/.selenium/selenium-server-standalone.jar http://selenium-release.storage.googleapis.com/2.53/selenium-server-standalone-2.53.1.jar
```

Start Selenium using Firefox 46.0.1

```
java -Dwebdriver.firefox.bin="$HOME/.firefox/46.0.1/Firefox.app/Contents/MacOS/firefox" -jar $HOME/.selenium/selenium-server-standalone.jar
```


# Reset test environment

```
drush --yes pm-enable devel devel_generate
```

```
# Remove all posts
drush generate-content --kill --types=post 0

# Remove all "subject" terms
drush generate-terms --kill subject 0
# Create "subject" terms
drush php-eval 'foreach (["test subject"] as $name) { taxonomy_term_save((object)["name" => $name, "vid" => taxonomy_vocabulary_machine_name_load("subject")->vid]); }'
```

```
drush secure-permissions-rebuild
drush user-create test-user --password=test-password
```

# Run tests

```
mkdir -p screenshots/{develop,staging}
```

```
rm screenshots/develop/*
./vendor/behat/behat/bin/behat
```

```
rm screenshots/staging/*
./vendor/behat/behat/bin/behat --profile=staging
```
