#
# == Define: git::userconfig
#
# Setup basic Git configurations for a user
#
# == Parameters
#
# [*title*]
#   The resource title should match the user's system username.
# [*fullname*]
#   Full name of the user.
# [*email*]
#   Email address of the user.
#
define git::userconfig
(
    $fullname,
    $email
)
{
    include ::git

    $username = $title

    Git::Config {
        section => 'user',
        user    => $username,
        require => User[$username],
    }

    git::config { "${username}-name":
        key   => 'name',
        value => $fullname,
    }

    git::config { "${username}-email":
        key   => 'email',
        value => $email,
    }
}
