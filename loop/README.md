LOOP
====


# Load test fixtures

```
vagrant ssh
drush sql-cli < fixtures/loop-test-db.sql
```

# Run features

```
rm -f screenshots/develop/*
../vendor/bin/behat
```
