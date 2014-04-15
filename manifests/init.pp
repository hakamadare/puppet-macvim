# Public: Install Macvim.
# On Mac OS X, MacVim can't build without a full Xcode install.
#
# Examples
#
#   class { 'macvim':
#     custom_icons => true,
#   }
class macvim (
  $custom_icons = false,
  $lua          = false,
) {
  case $::osfamily {
    'Darwin': {
      $opt_custom_icons = $custom_icons ? {
        true    => [ '--custom-icons' ],
        default => [],
      }
      $opt_lua = $lua ? {
        true    => [ '--with-lua', '--with-luajit' ],
        default => [],
      }
      $opt_base = [
          '--with-cscope',
          '--override-system-vim',
      ]
      $install_options = flatten([
        $opt_base,
        $opt_custom_icons,
        $opt_lua
      ])
      package { 'macvim':
        ensure          => installed,
        install_options => $install_options,
      }
    }

    default: {}
  }
}
