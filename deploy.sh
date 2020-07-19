#!/bin/bash

mod_name=$(cat info.json | jq -r '.name')
mod_version=$(cat info.json | jq -r '.version')

archive_name="${mod_name}_${mod_version}.zip"

zip -r ../$archive_name ./* -x .git
