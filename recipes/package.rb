include_recipe 'apt'

case node['platform_version'].to_f
  when 7
  when 7.1
  when 7.2
  when 7.3
  when 7.4
    release = 'wheezy'

  when 8
    release = 'jessie'

  when 10.04
    release = 'lucid'

  when 12.04
    release = 'precise'

  when 13.1
    release = 'saucy'

  when 16
    release = 'petra'

  else
    raise %W(Platform not supported: #{node['platform_family']} (#{node[:platform]}) #{node['platform_version']}).join(' ')
end

apt_repository 'hhvm' do
  uri          'http://dl.hhvm.com/'.concat(node[:platform])
  distribution release
  components   ['main']
  key          'http://dl.hhvm.com/conf/hhvm.gpg.key'
end

package 'hhvm'

if node['hhvm']['replace_php']
  execute 'replace php' do
    command '/usr/bin/update-alternatives --install /usr/bin/php php /usr/bin/hhvm 60'
  end
end

if node['hhvm']['install_fastcgi']
  execute 'install fastcgi' do
    command '/usr/share/hhvm/install_fastcgi.sh'
  end
end
