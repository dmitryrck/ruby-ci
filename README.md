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

For more information about pronto see [https://github.com/prontolabs/pronto](https://github.com/prontolabs/pronto).

Don't forget to submit your `.rubcop.yml` or `.pronto.yml` to your repository.
