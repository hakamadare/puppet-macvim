# MacVim Puppet Module for Boxen

[![Build Status](https://travis-ci.org/boxen/puppet-macvim.png?branch=master)](https://travis-ci.org/boxen/puppet-macvim)

Installs [MacVim](https://code.google.com/p/macvim/).  Can optionally build MacVim with custom document icons and with Lua support (both are disabled by default).

## Usage

```puppet
class { 'macvim':
  custom_icons => true,
  lua          => true,
}
```

## Required Puppet Modules

* boxen
* homebrew
* stdlib

Also requires a full Xcode install.

