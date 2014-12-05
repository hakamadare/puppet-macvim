# Public: Install Macvim.
# On Mac OS X, MacVim can't build without a full Xcode install.
#
# Examples
#
#   class { 'macvim':
#     ensure => 'latest',
#   }
class macvim (
  $ensure = 'installed'
) {
  case $::osfamily {
    'Darwin': {
      package { 'macvim':
        ensure          => $ensure,
        install_options => [
          '--with-cscope',
          '--override-system-vim',
          ];
      }
    }

    default: {}
  }
}
