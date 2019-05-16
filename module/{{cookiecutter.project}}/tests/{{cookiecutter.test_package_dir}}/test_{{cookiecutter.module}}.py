# -*- coding: utf-8 -*-

from {{cookiecutter.project_name}}.constants import *

import unittest
import logging

from {{cookiecutter.project_name}} import cfg
from {{cookiecutter.project_name}} import util
from {{cookiecutter.project_name}}.util import Error
from {{cookiecutter.pkg_name}} import {{cookiecutter.module}}
from tests import Object


class Test{{cookiecutter.Module}}(unittest.TestCase):

    def setUp(self):
        pass

    def tearDown(self):
        pass
