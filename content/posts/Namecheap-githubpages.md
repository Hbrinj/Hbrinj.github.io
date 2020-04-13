+++
title = "Integrating Namecheap and GitHub Pages"
date = "2020-03-12"
author = "Houman"
authorTwitter = "" #do not include @
cover = ""
tags = ["", ""]
keywords = ["", ""]
description = "Creating DNS records to utilise a custom domain with GitHub pages"
showFullContent = false
+++

Namecheap as the name suggests provides cheap names, in particular they provide domain names like the one this website is using. This site may or may not be on GitHub anymore when you the readers are reading this, but in its inception I went for the quick and dirty route and utilised GitHub Pages.

To point your domain to your GitHub Pages domain, follow this [Namecheap domain with GitHub pages tutorial](https://www.namecheap.com/support/knowledgebase/article.aspx/9645/2208/how-do-i-link-my-domain-to-github-pages).

{{< figure src="/img/blog/NamecheapAndGithubPages/g-pages-apr-12-2020.png" caption="GitHub pages configuration for Houman.codes" >}}

Once you have pointed your domain to GitHub you will need to open your GitHub repo, got to settings, scroll down until you see `GitHub Pages` and point the custom domain to your website, in my case its `Houman.codes`. This step will automatically create a `CNAME` file in either the `gh-pages` or `master` branches, if this file disappears so will the link between your domain and GitHub hosted web page.

You will have to wait at least 24 hours before you have the option to enforce HTTPS, during this time GitHub will utilise LetsEncrypt to generate a signed Certificate on behalf of your website. Just come back later and tick the option when its available.



