# ruby-ci

There are three images on this repo:

* the _main image_ has only the essential to run Ruby, connect with PostgreSQL, and to run automated tests using Google Chrome Headless, you may need to add more dependencies on your `Gemfile`
* the _style image_ runs static code checks using a gem called [pronto](https://github.com/prontolabs/pronto)
* _Cloud9 IDE_ has a webbrowser editor, I don't use this but I tested it out and it worked just fine; it may be outdated

It goes without saying, but those are three different docker images, they don't come together, pick the one that works for you.

I also try not to break the images that are already on hub.docker.com, instead of updating I change the name. For example:

The first version of _style check_ image was called `dmitryrck/ruby:ready` and one of the updated version is `dmitryrck/ruby:ready1`.

## Running automated tests with docker-compose

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

You can use `docker-compose up app` to start the app or `docker-compose run app command` to run a command inside the container.

Get more information about docker-compose here: https://docs.docker.com/compose/ .

## Using pronto with GitHub Actions

Create the file `.github/workflows/style.yml` with this content:

```
name: CI-style

on:
  push:
    branches-ignore:
      - integration*
      - main
      - prod/hotfix/*
      - production*
      - staging*
  pull_request:
    branches:
      - main
    types: [ opened, synchronize, ready_for_review ]

jobs:
  style:
    timeout-minutes: 5
    if: ${{ github.event_name == 'pull_request' || github.ref == 'refs/heads/main' }}
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@master
      - name: "git fetch"
        run: |
          git fetch --no-tags --prune --depth=10 origin +refs/heads/*:refs/remotes/origin/*
      - run: docker pull dmitryrck/ruby:ready1
      - env:
          PRONTO_PULL_REQUEST_ID: ${{ github.event.pull_request.number }}
          PRONTO_GITHUB_ACCESS_TOKEN: "${{ github.token }}"
        run: docker run -e PRONTO_PULL_REQUEST_ID -e PRONTO_GITHUB_ACCESS_TOKEN --rm -v ~/.npm-docker:/root/.npm -v $(pwd):/app -w /app dmitryrck/ruby:ready1 pronto run --exit-code -f github_pr -c origin/${{ github.base_ref }}
```

Replace `main` with the name of the branch the PRs go to.

This workflow is heavily based on [https://github.com/prontolabs/pronto#github-actions-integration](https://github.com/prontolabs/pronto#github-actions-integration) all credits to the pronto team ♥️.

As I said before, the code quality images start with `ready*` you may need to change it on the YAML file based on your needs.
