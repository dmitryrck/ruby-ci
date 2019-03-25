# Running

The main image has only the essential to run Ruby, connect with PostgreSQL, and to run automated tests using Google Chrome Headless.

For other images see the [Other images](#other-images).

## Using with docker-compose

```yaml
version: "3"

services:
  app:
    image: dmitryrck/ruby
    volumes:
      - .:/app
      - bundle_path:/usr/local/bundle
    environment:
      - BUNDLE_APP_CONFIG=/app/.bundle
      - DISABLE_SPRING=1
      - DISABLE_PRY_RAILS=1
      - DISABLE_DATABASE_ENVIRONMENT_CHECK=1
    working_dir: /app
    command: bundle exec rails server -b 0.0.0.0 -p 3000
    depends_on:
      - "db"
    ports:
      - "3000:3000"

volumes:
  bundle_path:
```

And you can use `docker-compose up app`.

## Other images

* [Code quality](ready)
* [Cloud9 IDE](c9)
