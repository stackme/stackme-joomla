#!/usr/bin/env bash
# Copyright (C) 2016, Mykro Enterprises New Zealand Limited.
# Copyright (C) 2016, Matthew Hartstonge <matt@mykro.co.nz> and other Authors.
# All rights reserved.
#
# Use of this source code is governed by a BSD 3-clause license that can be found
# in the LICENSE file.

# Take in vars for CSR request
read -r -p "Country Name (2 letter code) [AU]: " countryName
read -r -p "State or Province Name (full name) [Some-State]: " provinceName
read -r -p "Locality Name (eg, city) []: " localityName
read -r -p "Organization Name (eg, company) [Internet Widgits Pty Ltd]: " organisationName
read -r -p "Organizational Unit Name (eg, section) []: " organisationalUnitName
read -r -p "Common Name (e.g. domain name/server FQDN) []: " commonName

# Generate a Private Key and a CSR
openssl req \
       -newkey rsa:2048 -nodes -keyout domain.key \
       -subj "/C=$countryName/ST=$provinceName/L=$localityName/O=$organisationName/OU=$organisationalUnitName/CN=$commonName" \
       -out domain.csr

# Generate a Self-Signed Certificate from an Existing Private Key and CSR
openssl x509 \
       -signkey domain.key \
       -in domain.csr \
       -req -days 365 -out domain.crt

# Generate Diffie-Hellman certificate
sudo openssl dhparam -out dhparam.pem 2048
