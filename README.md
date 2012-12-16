# Sssmoke

Slap Ruby scripts on a web server in seconds.

## Installation

    gem install sssmoke

## Usage

Go to a folder containing erb templates, and:

    sssmoke

For example, a template named _foo.erb_ will be available at _http://localhost:8888/foo_.

## Pro Usage for Powah Usahs

If you want to sssmoke a directory other than the current directory:

    sssmoke <directory name>

To smoke a single erb template at _http://localhost:8888_:

    sssmoke <file name>
