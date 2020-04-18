+++
title = "Build Your Hugo Site Using GitHub Actions"
date = "2020-04-18"
author = "Houman"
authorTwitter = "" #do not include @
cover = "" 
tags = []
keywords = ["GitHub", "Actions", "GitHub Pages","Hugo", "Static"]
description = "Build your Hugo website using GitHub Actions"
showFullContent = false
+++

GitHub Actions are a suite of user and GitHub created abilities which allow you to declare a pipeline straight in GitHub. They permit your project to build and deploy different components without the need for spinning up your own CI/CD infrastructure. GitHub Actions run using docker containers which allow you to bake in any required dependencies.

A bundle of actions is called a workflow on GitHub and it exists within your repo under `.github/workflows/`, if you do not have the folder you can create it using `mkdir -P .github/workflows` in top level directory of the repository.

```yaml
name: github pages
on:
  push:
    branches:
      - develop

jobs:
  deploy:
    runs-on: ubuntu-18.04
    steps:
      - uses: actions/checkout@v2
        with:
          submodules: true
          fetch-depth: 0

      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: 'latest'
          extended: true

      - name: Build
        run: hugo --minify

      - name: CNAME
        run: |
          echo "houman.codes" > ./public/CNAME

      - name: Deploy
        uses: crazy-max/ghaction-github-pages@v1
        with:
          target_branch: master
          build_dir: ./public
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}      
```

Above is an example workflow  which utilises the GitHub Action [checkout](https://github.com/actions/checkout) to checkout the code, [Actions Hugo by Peaceiris](https://github.com/peaceiris/actions-hugo) to provide the necessary prerequisites to build the Hugo website and [ghaction github pages by Crazy-Max](https://github.com/crazy-max/ghaction-github-pages) to push the contents of the `public` folder, where the static files are created after running `hugo --minify` to the `master` branch, where GitHub pages is expecting the website to be.

This workflow is kicked off when there is a `push` to the `develop` branch, this results in a fresh website build after pull request are merged to develop. You can see how this website and the workflow work by going [here](https://github.com/Hbrinj/Hbrinj.github.io)
