# Pip require virtualenv trick

Add the following lines to your bash_profile

```dot
export PIP_REQUIRE_VIRTUALENV=true

gpip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
```

# To see reproduce the demo

Build the docker and run it:

```bash
docker build -t <your_tag> .
docker run -p 8888:8888 -it <your_tag>
```

Run pip freeze to see that your global environment contains jupyter:

```bash
pip freeze | grep jupyter
```

Open another terminal in the docker container and enter the virtualenv:

```bash
docker exec -it <docker_container_id> /bin/bash
source venv/bin/activate
```

Run pip freeze again to see that the virtualenv ***does not*** contain jupyter:

```bash
pip freeze | grep jupyter
```

Pip install some packages (not jupyter):

```bash
pip install <package_a> <package_b>
```

Although jupyter is not installed in your virtualenv, you can still use it because it is installed in your global environment. Jupyter will therefore pick your global interpreter with its installed packages. Try for yourself in a notebook:

```bash
jupyter-notebook
```
Of course you can solve this by adding the virtualenv as a kernel to your notebook but in general you do not want to pollute your global environment to prevent weird dependency errors.







