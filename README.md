# Sssmoke

Slap Ruby scripts on a web server in seconds.

## Installation

    $ gem install sssmoke

## Usage

Put erb templates in a directory (with extension _erb_).

To put the whole directory on a web server, run:

    sssmoke

Now open:

    http://localhost:<your web server's default port>/<name of erb script>


## Pro Usage for Powah Usah

If you want to sssmoke a directory other than the current directory:

    sssmoke <directory name>

To expose a single template at the server's root:

    sssmoke <file name>


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
