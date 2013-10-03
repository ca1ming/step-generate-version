# step-generate-version

Sets an environment variable to contain a build nr. This step depends on a running instance of (buildnr.herokuapp.com)[http://buildnr.herokuapp.com] or your own instance of the python/django app: (github.com/flenter/versioning_service)[https://github.com/flenter/versioning_service]

For this step you need to:

* login/register on (buildnr.herokuapp.com)[http://buildnr.herokuapp.com]
* add an application (which is not much more than a name)
* go to the details of the application and you will find the values for the parameters of this step.

# What's new

- set environment variable GENERATED_BUILD_NR with the value returned from the versioning service

# Options

* `api_key` (required) The api key
* `username` (required) The username on the build number site (not wercker)
* `for_app` (required) The id of the app on the build number site
* `ignore_branches` (optional, default: 'false'). Whether to reset numbering with each branch or not.
* `base_url` (optional, default: 'http://buildnr.herokuapp.com')

# Example

```yaml
build:
  steps:
    - flenter/generate-version:
        api_key: e5da976d9f679e38c2faa04d3ecc92f3485e1517
        username: admin
        for_app: 1
```

# License

The MIT License (MIT)

Copyright (c) 2013 wercker

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Changelog

## 0.0.1

- Initial release
