#!/bin/bash

mod_name=$(cat info.json | jq -r '.name')
mod_version=$(cat info.json | jq -r '.version')

archive_name="${mod_name}_${mod_version}.zip"

mod_dir=""
if [ -d "$FACTORIO_MOD_DIR" ]; then
  # Control will enter here if $DIRECTORY exists.
  mod_dir=$FACTORIO_MOD_DIR
fi



zip -r "${mod_dir}${archive_name}" ./* -x .git
