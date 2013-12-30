#
# Copyright (C) 2013 eNovance SAS <licensing@enovance.com>
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#
# == Class: privatecloud::object
#
# Common class for object storage nodes
#
# === Parameters:
#
# [*swift_hash_suffix*]
#   (optional) String of text to be used as a salt when hashing to determine mappings in the ring.
#   Default value in params
#

class privatecloud::object(
  $swift_hash_suffix = $os_params::swift_hash_suffix
) {

  class { 'ssh::server::install': }

  class { 'swift':
    swift_hash_suffix => $swift_hash_suffix,
  }

  class {'privatecloud::object::tweaking': }

}