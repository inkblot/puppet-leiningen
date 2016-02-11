# ex: si ts=4 sw=4 et
class leiningen {
    File {
        owner  => 'root',
        group  => 'root',
        mode   => '0755',
    }

    file { '/usr/local/share/leiningen':
        ensure => directory,
    } ->

    wget::fetch { 'https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein':
        destination => '/usr/local/share/leiningen/lein',
        timeout     => 0,
        verbose     => false,
    } ~>

    file { '/usr/local/bin/lein':
        ensure => present,
        source => '/usr/local/share/leiningen/lein',
    }
}
