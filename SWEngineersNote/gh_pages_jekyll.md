# GitHub Pages x Jekyll
## Installation (OS X)
### Installing Jekyll
1. First, you need Ruby to use Jekyll, so open Terminal, check if an appropriate version of Ruby is installed:
```bash
$ ruby --version
```
**If You Need to Update Ruby**
Use Homebrew to install rbenv, ruby-build first:
```bash
$ brew update
$ brew install rbenv ruby-build
```
Then, go to your default directory in your Terminal (simply type `cd` to get to it), add this to `.bash_profile` file:
```bash
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
```
Install the updated version Ruby using `rbenv`:
```bash
$ rbenv install 2.3.3
```
And set the global version:
```bash
$ rbenv global 2.3.3
```
Check if the version is correct:
```bash
$ ruby -v
```
If, Ruby version remains unchanged, then try below & restarting the Terminal:
```bash
$ rbenv rehash
``` 
2. Install Bundler:
```bash
gem install bundler
```
3. Go to the GitHub Pages repository you created, create a file named `Gemfile` with the following contents inside it, and save it (Note that the file doesn't have any file extension):
```bash
source 'https://rubygems.org'
gem 'github-pages', group: :jekyll_plugins
```
4. Install Jekyll and other dependencies from the GitHub Pages gem:
```bash
$ bundle install
```
5. Then, create a Jekyll template site in a new directory:
```bash
$ jekyll new username.github.io
```

To checkout the site locally: `jekyll serve --watch`

### Creating a GitHub Repository and "Linking" it to Jekyll
1. Create a repository named after `username.github.io`. Make sure to replace `username` with your actual username.
2. Then, go to the directory where the files for the Jekyll site are placed in, init, add, commit, push the files to the GitHub repository you just created:
```bash
$ git init
$ git remote add origin {GitHubRepoURL}
$ git add -A
$ git commit -m "Initial Commit"
$ git push origin master
```
Make sure to replace `{GitHubRepoURL}` with the actual GitHub repository URL.


## After Installation
### Site Settings
For settings that affect the whole blog, change the values found in `_config.yml`. The values can be accessed via `{{site.title}}`, `{{site.email}}`, and so on. You can create any custom variable you would like, and they will be accessible in the templates via `{{site.myvariable}}`.

### Writing a Post
To add new posts, simply add a file in the `_posts` directory that follows the convention `YYYY-MM-DD-name-of-post.ext` and includes the necessary front matter. 

Check out the [Jekyll docs](http://jekyllrb.com/docs/home) for more info on how to get the most out of Jekyll.


## More About Jekyll
### Front Matter
Any file that contains a YAML front matter block will be processed by Jekyll as a special file. The front matter **must be the first thing in the file** and must take the form of valid YAML **set between triple-dashed lines**.

An example:
```
---
layout: post
title: Blogging Like a Hacker
---
```

Between the triple-dashed lines, you can set **predefined variables** or **create custom ones** of your own. The variables will then be available to you to access using Liquid tags further down in the file and also in any `layout`s or `include`s that the page or post in question relies on.

#### Predefined Global Variables
| Variable | Description |
|:--|:--|
| `layout` | If set, this specifies the layout file to use. Use the layout file name without the file extension. Layout files must be placed in the `_layouts` directory. |
| `permalink` | If you need your processed blog post URLs to be something other than the site-wide style (default `/year/month/day/title.html`), then you can set this variable and it will be used as the final URL. |
| `published` | Set to false if you don’t want a specific post to show up when the site is generated. |

#### Predefined Variables for Posts

| Variable | Description |
|:--|:--|
| `date` | A date here overrides the date from the name of the post. This can be used to ensure correct sorting of posts. A date is specified in the format `YYYY-MM-DD HH:MM:SS +/-TTTT`; hours, minutes, seconds, and timezone offset are optional. |
| `category`, `categories` | Instead of placing posts inside of folders, you can specify one or more categories that the post belongs to. When the site is generated the post will act as though it had been set with these categories normally. Categories (plural key) can be specified as a YAML list or a space-separated string. |
| `tags` | Similar to categories, one or multiple tags can be added to a post. Also like categories, tags can be specified as a YAML list or a space-separated string. |

#### Custom Variables
Any variables that are not predefined are mixed into the data that is sent to the Liquid tempting engine during the conversion. For instance, if you set a title, you can use that in your layout to set the page title:
```html
<!DOCTYPE HTML>
<html>
  <head>
    <title>{{ page.title }}</title>
  </head>
  <body>
    ...
```

## Reference
- [GitHub: Setting up your github pages site locally with Jekyll](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/)
- [Jekyll Documentation: Front Matter](http://jekyllrb.com/docs/frontmatter/)