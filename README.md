# Sssmoke

![Build Status](https://secure.travis-ci.org/nusco/sssmoke.png)

Slap Ruby scripts on a web server in seconds.

Warning: Sssmoke is *not* intended for public servers. It's just an ultra-quick way to put scripts on one of your own machines - like, a build machine.

## Installation

    gem install sssmoke

## Usage

Put your erb templates in a directory, then run them in a web server by typing:

    sssmoke

A template named `foo.erb` will get the URL `http://localhost:8888/foo`.

## Pro Usage for Powah Usahs

    sssmoke directory_name      # sssmoke templates from another directory
    sssmoke template_name.erb   # sssmoke a single template at http://localhost:8888/

That's all. (As to the reason why it's called "Sssmoke" - that story would be better told in person.)
