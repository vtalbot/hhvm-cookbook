hhvm3 Cookbook
=============

Requirements
------------

#### packages
- `apt`

Attributes
----------

#### hhvm::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['hhvm3']['replace_php']</tt></td>
    <td>Boolean</td>
    <td>Replace `php` with `hhvm`</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['hhvm3']['install_fastcgi']</tt></td>
    <td>Boolean</td>
    <td>Install hhvm fastcgi for `apache`, `nginx` if present in system.</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### hhvm3::default

This will install HHVM using packages.

#### hhvm3::package

This will install HHVM using packages.
