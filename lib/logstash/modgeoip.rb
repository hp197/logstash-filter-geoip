# encoding: utf-8
#
# Overloading class for cjheath/geoip
# We will adjust some functions to our own needs
#
# = COPYRIGHT
#
# This version Copyright (C) 2005 Clifford Heath
# Derived from the C version, Copyright (C) 2003 MaxMind LLC
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
#
#

require 'geoip'

class LogStash::ModGeoIP < GeoIP

  # Open the GeoIP database and determine the file format version.
  #
  # +filename+ is a String holding the path to the GeoIP.dat file
  # +options+ is a Hash allowing you to specify the caching options
  #
  def initialize(filename, options = {})
    @use_pread = false

    @options = options
    @database_type = Edition::COUNTRY
    @record_length = STANDARD_RECORD_LENGTH
    @file = File.open(filename, 'rb')

    detect_database_type!
  end

  def atomic_read(length, pos)
    atomic_read_unguarded(length, pos)
  end
end # class modGeoIP

