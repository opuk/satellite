#!/usr/bin/env python

import json
import sys

try:
  import requests
except ImportError:
  print "Please install the python-requests module."
  sys.exit(-1)

# URL to your Satellite 6 server
URL = "https://satellite.example.com"
# URL for the API to your deployed Satellite 6 server
SAT_API = "%s/katello/api/v2/" % URL
# Katello-specific API
KATELLO_API = "%s/katello/api/" % URL
POST_HEADERS = {'content-type': 'application/json'}
# Default credentials to login to Satellite 6
USERNAME = "admin"
PASSWORD = "redhat"
# Ignore SSL for now
SSL_VERIFY = False

def get_json(location):
  r = requests.get(location, auth=(USERNAME, PASSWORD), verify=SSL_VERIFY)
  return r.json()

def list_hosts():
  hosts = get_json(SAT_API + "systems/")
  for host in hosts['results']:
    print host['name']

list_hosts()
