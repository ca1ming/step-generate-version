#!/usr/bin/env python

from optparse import OptionParser
import urllib2
import sys


parser = OptionParser()

parser.add_option("-U", "--url", type="string", dest="url")
parser.add_option("-u", "--user", type="string", dest="username")
parser.add_option("-k", "--key", type="string", dest="key")
parser.add_option("-a", "--appId", type="string", dest="app")
parser.add_option("-b", "--branch", type="string", dest="branch")
parser.add_option("-c", "--commit", type="string", dest="commit")

(options, args) = parser.parse_args()

if options.url.endswith("/") is False:
    options.url += "/"

url = "{url}api/v1/branch_version?format=json&".format(url=options.url)

url += "username={user}&api_key={key}".format(
    user=options.username,
    key=options.key)

url += "&for_app={app}&for_branch={branch}&commit_hash={commit}".format(
    app=options.app,
    branch=options.branch,
    commit=options.commit
)

try:
    f = urllib2.urlopen(url)

    status_code = f.getcode()

except urllib2.HTTPError as e:
    status_code = e.code
except urllib2.URLError as e:
    sys.exit("""Error: Failed to reach server.
Reason: {reason}""".format(reason=e.reason))

if status_code == -1:
    sys.exit("Unable to connect to {url}".format(url=url))
elif status_code != 200:
    sys.exit(
        """Server couldn't fulfill the request.
url: {url}
status code: {code}""".format(
        url=url,
        code=status_code
    ))
else:
    import json

    data = json.load(f)
    meta = data.get("meta")
    if meta and meta.get("total_count") == 1:
        obj = data.get("objects")[0]
        version_number = obj.get("version_number")
        print version_number
    else:
        sys.exit("Unexpected return data: " + data)