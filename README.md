# Running

## Using with docker-compose.

```yaml
version: "3"

services:
  app:
    image: dmitryrck/ruby
    volumes:
      - .:/app
      - bundle_path:/bundle
    environment:
      - HOME=/root
      - BUNDLE_PATH=/bundle/vendor
      - BUNDLE_APP_CONFIG=/app/.bundle
      - BUNDLE_BIN=/bundle/vendor/bin
      - DISABLE_DATABASE_ENVIRONMENT_CHECK=1
      - GEM_HOME=/bundle/vendor
    working_dir: /app
    command: bundle exec puma -p 3000 config.ru
    depends_on:
      - "db"
    ports:
      - "3000:3000"
```

And you can use `docker-compose up app`.

## Code quality

You can check your code quality with:

```terminal
$ docker run -v $(pwd):/app -w /app --rm dmitryrck/ruby:ready rubocop
```

To verify only your changes in the PR use:

```terminal
$ docker run -v $(pwd):/app -w /app --rm dmitryrck/ruby:ready pronto run --exit-code -c origin/master
```

*Warning*. [eslint](https://eslint.org) is the only runner that breaks if there is no config file. I found no way to disable a runner in pronto, so you have to create an empty file to run `dmitryrck/ruby:ready`:

```terminal
$ touch .eslintrc.js
```

For more information about pronto see [https://github.com/prontolabs/pronto](https://github.com/prontolabs/pronto).
