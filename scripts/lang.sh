#!/bin/bash

dart run easy_localization:generate  -O modules/common/lib/constants -f keys -o locale_keys.g.dart --source-dir assets/translations
