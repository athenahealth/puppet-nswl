# puppet-nswl

A puppet module for managing and configuring NSweblog

## Usage

Installation, make sure service is running and will be started at boot
time:

     class { 'nswl': }

Removal/decommissioning:

     class { 'nswl':
       ensure => 'absent',
     }

Install everything but disable service(s) afterwards:

     class { 'nswl':
       status => 'disabled',
     }

