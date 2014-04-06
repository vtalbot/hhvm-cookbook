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

php_replaced = "#{Chef::Config[:file_cache_path]}/php_replaced"
hhvm_fastcgi_installed = "#{Chef::Config[:file_cache_path]}/hhvm_fastcgi_installed"

if node['hhvm3']['replace_php']
  execute 'replace php' do
    command '/usr/bin/update-alternatives --install /usr/bin/php php /usr/bin/hhvm 60'
    not_if do
      ::File.exists?(php_replaced)
    end
  end

  file php_replaced do
    owner 'root'
    group 'root'
    mode '0644'
    action :create_if_missing
  end
end

if node['hhvm3']['install_fastcgi']
  execute 'install fastcgi' do
    command '/usr/share/hhvm/install_fastcgi.sh'
    not_if do
      ::File.exists?(hhvm_fastcgi_installed)
    end
  end

  file hhvm_fastcgi_installed do
    owner 'root'
    group 'root'
    mode '0644'
    action :create_if_missing
  end
end
