# My Journal App

Ruby on Rails task management application

#### Version

```
  Ruby 2.7.2
  Rails 6.1.3.2
  Bootsrap
  Node v14.4.0
  Yarn 1.22.4
```

#### Getting started
To get started with the app, clone the repo and then install the needed gems:
```
$ bundle install
```
Next, migrate the database:
```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:
```
$ rspec spec
```
If the test suite passes, you'll be ready to run the app in a local server:
```
$ rails server