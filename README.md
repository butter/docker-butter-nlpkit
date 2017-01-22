Butter.ai NLP Toolkit
=====================

## Supported tags and respective `Dockerfile` links

-	[`2017-01`, `py2` (*2017-01/Dockerfile*)](https://github.com/butter/docker-butter-nlpkit/blob/5eb7fae3b14a45e6ffcff4a683dd9d1790943459/py2/2017-01/Dockerfile)
-	[`py3-2017-01`, `py3`, `latest` (*py3-2017-01/Dockerfile*)](https://github.com/butter/docker-butter-nlpkit/blob/5eb7fae3b14a45e6ffcff4a683dd9d1790943459/py3/2017-01/Dockerfile)

## What is Butter nlpkit

nlpkit is a set of tools and packages used for machine learning and natural language processing at Butter.ai. These include python numpy/scipy, Spacy, and scikit-learn, among others.

## How to use this image

### Create a `Dockerfile` in your Python app project

```dockerfile
FROM butter/butter-nlpkit:py3-2017-01
CMD [ "python", "./your-daemon-or-script.py" ]
```

or (if you need to use Python 2):

```dockerfile
FROM butter/butter-nlpkit:2017-01
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
