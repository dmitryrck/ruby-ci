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

## Troubleshooting

### "I'm using dmitryrck/ruby:ready, but it does not check my *.vue files."

You have to create `.pronto_eslint_npm.yml` with this content:

```yaml
files_to_lint: "(js|vue)"
```

And update your `.eslintrc.js` to something similar to:

```javascript
module.exports = {
  "extends": [
    "eslint:recommended",
    "plugin:vue/recommended",
  ],
}
```

### "It is not checking *.vue files properly"

I can only say:

> I know that feel bro

![](I-know-that-feeling-bro.jpg)

Changes like:

```diff
 <template>
-  <div>
+    <div>
     <div>
```

Are checked fine, but something like:

```diff
 <script>
-import CoolComponent from "@/CoolComponent"
+  import CoolComponent from "@/CoolComponent"
```

Is not. And I have no idea why.

### "ESLint says: Oops! Something went wrong! :("

If you change a `.js` pronto will call ESLint. I found no way to disable a runner in pronto. You can build yourself a [ready](https://github.com/dmitryrck/ruby-ci/tree/ready) image or create an empty file:

```terminal
$ touch .eslintrc.js
```

This way ESLint will use a default configuration.
