# bc-vo1-payments ![test-and-deploy](https://github.com/gowda/bc-vo1-payments/workflows/test-and-deploy/badge.svg)


RESTful HTTP API for `payments` resource

## Run
### Setup
```bash
$ bundle install
$ bin/setup
```

### Server
```bash
$ bin/rails server
```

### List endpoints
```bash
$ bin/rails routes
```
|Prefix|Verb|URI Pattern|Controller#Action|
|---|---|---|---|
|contract_payments|GET|/api/v1/contracts/:contract_id/payments(.:format)|payments#index|
||POST|/api/v1/contracts/:contract_id/payments(.:format)|payments#create|
|payment|PATCH|/api/v1/payments/:id(.:format)|payments#update|
||PUT|/api/v1/payments/:id(.:format)|payments#update
||DELETE|/api/v1/payments/:id(.:format)|payments#destroy|

### Tests
```bash
$ bin/rails spec

# Or
$ bundle exec rspec
```

### Rubocop
```bash
$ bin/rails cop

# Or
$ bundle exec rubocop
```

## Author
Basavanagowda Kanur <basavanagowda@gmail.com>
