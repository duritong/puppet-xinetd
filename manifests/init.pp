#######################################
# xinetd module
# Puzzle ITC - haerry+puppet(at)puzzle.ch
# GPLv3
#######################################


# modules_dir { "xinetd": }
class xinetd {
    package{'xinetd':
        eunsre => present,
    }

    service{'xinetd':
        ensure => running,
        enable => true,
        hasstatus => true,
        require => Package[xinetd],
    }
}
