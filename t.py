#!/usr/bin/env python
# -*- coding: utf-8 -*-

# ————————————————————————————————————————————————————————————————————————————
# Copyright © 2019, Prabhat Kumar, All rights reserved.
# ————————————————————————————————————————————————————————————————————————————

import os
import howdy

is_test_run = 'TEST' in os.environ

if __name__ == '__main__' and not is_test_run:
    howdy.app.run()

# Licensed under the Apache License (the "License, version 2.0");
# you may not use this file except in compliance with the License.
# ————————————————————————————————————————————————————————————————————————————
