name                     'hhvm3'
maintainer               'Vincent Talbot'
maintainer_email         'vincent.talbot@gmail.com'
license                  'MIT'
description              'Installs/Configures hhvm'
long_description         IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version                  '0.1.1'

depends                  'apt'

supports                 'debian'
supports                 'ubuntu'

recipe 'hhvm3',          'Installs hhvm'
recipe 'hhvm3::package', 'Installs hhvm using packages.'
