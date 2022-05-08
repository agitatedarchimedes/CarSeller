import os
import pathlib
from setuptools import setup

def read(fname):
    # return open(os.path.join(os.path.dirname(__file__), fname)).read()
    return pathlib.Path(__file__).parent.joinpath(fname)

setup(
    name = "car_seller",
    version = "0.0.1",
    author = "WSB",
    author_email = "wsb@example.com",
    description = ("Car Seller project"),
    license = "BSD",
    keywords = "example documentation tutorial",
    url = "http://packages.python.org/an_example_pypi_project",
    packages=['an_example_pypi_project', 'tests'],
    long_description=read('README'),
    classifiers=[
        "Development Status :: 3 - Alpha",
    ],
)