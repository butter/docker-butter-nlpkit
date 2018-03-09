Butter.ai NLP Toolkit
=====================

## Supported tags and respective `Dockerfile` links
74f20f5cdd678d0a32b967bd07c5c3db0de3987c
-	[`2018-03`, `py2` (*py2/Dockerfile*)](https://github.com/butter/docker-butter-nlpkit/blob/74f20f5cdd678d0a32b967bd07c5c3db0de3987c/py2/Dockerfile)
-	[`2017-05` (*py2/2017/04/Dockerfile*)](https://github.com/butter/docker-butter-nlpkit/blob/16cfc18bff5f73f2b09ef527955aedd6ab0153d2/py2/2017-05/Dockerfile)
-	[`2017-04` (*py2/2017/04/Dockerfile*)](https://github.com/butter/docker-butter-nlpkit/blob/22e06981b57b9eb42d2b01f68c3ff48bd7dcf924/py2/2017-04/Dockerfile)
-	[`2017-03` (*py2/2017/03/Dockerfile*)](https://github.com/butter/docker-butter-nlpkit/blob/b1e5ad481f7d5e99f33fc9d0ad06bfe05a115f19/py2/2017-03/Dockerfile)
-	[`2017-01` (*py2/2017/01/Dockerfile*)](https://github.com/butter/docker-butter-nlpkit/blob/5eb7fae3b14a45e6ffcff4a683dd9d1790943459/py2/2017-01/Dockerfile)
-	[`py3-2017-03`, `py3`, `latest` (*py3/Dockerfile*)](https://github.com/butter/docker-butter-nlpkit/blob/74f20f5cdd678d0a32b967bd07c5c3db0de3987c/py3/Dockerfile)
-	[`py3-2017-05` (*py3/2017-04/Dockerfile*)](https://github.com/butter/docker-butter-nlpkit/blob/16cfc18bff5f73f2b09ef527955aedd6ab0153d2/py3/2017-05/Dockerfile)
-	[`py3-2017-04` (*py3/2017-04/Dockerfile*)](https://github.com/butter/docker-butter-nlpkit/blob/22e06981b57b9eb42d2b01f68c3ff48bd7dcf924/py3/2017-04/Dockerfile)
-	[`py3-2017-03` (*py3/2017-03/Dockerfile*)](https://github.com/butter/docker-butter-nlpkit/blob/b1e5ad481f7d5e99f33fc9d0ad06bfe05a115f19/py3/2017-03/Dockerfile)
-	[`py3-2017-01` (*py3/2017-01/Dockerfile*)](https://github.com/butter/docker-butter-nlpkit/blob/5eb7fae3b14a45e6ffcff4a683dd9d1790943459/py3/2017-01/Dockerfile)

## What is Butter nlpkit

nlpkit is a set of tools and packages used for machine learning and natural language processing at Butter.ai. These include python numpy/scipy, Spacy, and scikit-learn, among others.

## How to use this image

### Create a `Dockerfile` in your Python app project

```dockerfile
FROM butter/butter-nlpkit:py3-2018-03
CMD [ "python", "./your-daemon-or-script.py" ]
```

or (if you need to use Python 2):

```dockerfile
FROM butter/butter-nlpkit:2018-03
CMD [ "python", "./your-daemon-or-script.py" ]
```

### Run a single Python script

For many simple, single file projects, you may find it inconvenient to write a complete `Dockerfile`. In such cases, you can run a Python script by using the Python Docker image directly:

```console
$ docker run -it --rm --name my-running-script -v "$PWD":/usr/src/myapp -w /usr/src/myapp butter/butter-nlpkit:py3 python your-daemon-or-script.py
```

or (again, if you need to use Python 2):

```console
$ docker run -it --rm --name my-running-script -v "$PWD":/usr/src/myapp -w /usr/src/myapp butter/butter-nlpkit:py2 python your-daemon-or-script.py
```

## License

View license information for [Python 2](https://docs.python.org/2/license.html) and [Python 3](https://docs.python.org/3/license.html).
