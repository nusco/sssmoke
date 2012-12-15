# Sssmoke

Slap Ruby scripts on a web server in seconds.

## Installation

    gem install sssmoke

## Usage

Go to a folder containing erb templates, and:

    sssmoke

For example, a template named _foo.erb_ will be available at _http://localhost:4567/foo_. (The port number could be different if you use a web server other than WEBrick).

## Pro Usage for Powah Usahs

If you want to sssmoke a directory other than the current directory:

    sssmoke <directory name>

To smoke a single erb template at _http://localhost:4567_:

    sssmoke <file name>
