[![Build Status](https://secure.travis-ci.org/asoesilo/fansnatic-web.png)](http://travis-ci.org/asoesilo/fansnatic-web)

## fansnatic-web

## Stack

- Gulp
- Angular
- Bower
- Coffeescript
- Stylus
- Jade


## Overview

The gulp pipelines are contained in the `/gulp` folder. All your coding should be done in `/src`. Note as well that you should not need to edit `/src/index.jade` that much. All your Javascript and CSS is concatenated, and all bower dependencies are injected automatically. Wow.

## Usage

Clone the repo; install dependencies:

```
npm install
bower install
```

- `gulp` Compile your source into `/public` and start a local server
- `gulp build` Build your app into `/dist`
- `gulp serveDist` Start a local server and serve up what you just built
- `gulp deploy` Deploys dist/ folder to gh-pages (you have to build first!)
