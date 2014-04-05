hhvm Cookbook
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
    <td><tt>['hhvm']['replace_php']</tt></td>
    <td>Boolean</td>
    <td>Replace `php` with `hhvm`</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['hhvm']['install_fastcgi']</tt></td>
    <td>Boolean</td>
    <td>Install hhvm fastcgi for `apache`, `nginx` if present in system.</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### hhvm::default

This will install HHVM using packages.

#### hhvm::package

This will install HHVM using packages.
