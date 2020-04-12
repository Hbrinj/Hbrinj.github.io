+++
title = "Integrating Namecheap and Github Pages"
date = "2020-03-12"
author = "Houman"
authorTwitter = "" #do not include @
cover = ""
tags = ["", ""]
keywords = ["", ""]
description = "Creating DNS records to utilise a custom domain with github pages"
showFullContent = false
+++

Name cheap as the name suggests provides cheap names, in particular they provide domain names like the one this website is using. This site may or may not be on Github anymore when you the readers are reading this, but in its inception I went for the quick and dirty route and utilised Github Pages.

To point your domain to your Github Pages domain, follow this [Namecheap domain with github pages tutorial](https://www.namecheap.com/support/knowledgebase/article.aspx/9645/2208/how-do-i-link-my-domain-to-github-pages).

{{< image src="/img/blog/NamecheapAndGithubPages/g-pages-apr-12-2020.png" alt="logo" >}}

Once you have pointed your domain to Github you will need to open your github repo, got to settings, scroll down until you see `Github Pages` and point the custom domain to your website, in my case its `houman.codes`. This step will automatically create a `CNAME` file in either the `gh-pages` or `master` branches, if this file dissapears so will the link between your domain and github hosted webpage.

You will have to wait at least 24 hours before you have the option to enfore HTTPS, during this time Github will utilise LetsEncrypt to generate a signed Certificate on behalf of your website. Just come back later and tick the option when its available.



