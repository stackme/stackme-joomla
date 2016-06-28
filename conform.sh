#!/usr/bin/env bash
# Copyright (C) 2016, Mykro Enterprises New Zealand Limited.
# Copyright (C) 2016, Matthew Hartstonge <matt@mykro.co.nz> and other Authors.
# All rights reserved.
#
# Use of this source code is governed by a BSD 3-clause license that can be found
# in the LICENSE file.

# Run this script under sudo or root in order to overwrite properly second time
# around.
mkdir -p dbdata
mkdir -p html
chmod 755 html
mkdir -p logs
chmod 755 logs
# Alpine uses non-debian standards for www-data, so for the host we explicitly
# have to set files to uid/gid 82.
# TODO: Test default file permissions on multiple OS
#chown -R 82:82 html
#chown -R 82:82 logs
chmod 644 tls/*.crt
chmod 640 tls/*.key
