#
# == Class: git::params
#
# Defines some variables based on the operating system
#
class git::params {

    case $::osfamily {
        'RedHat': {
            $package_name = 'git'
            $package_provider = undef
        }
        'Debian': {
            $package_name = 'git'
            $package_provider = undef
        }
        'windows': {
            $package_name = 'git'
            $package_provider = 'chocolatey'
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }
}
