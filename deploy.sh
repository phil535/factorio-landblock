#!/bin/bash

mod_name=$(cat info.json | jq -r '.name')
mod_version=$(cat info.json | jq -r '.version')

archive_name="${mod_name}_${mod_version}.zip"

tempdir=$(mktemp -d)

echo $tempdir

mkdir "${tempdir}/${mod_name}_${mod_version}"

rsync -r --exclude '.git' . "${tempdir}/${mod_name}_${mod_version}"

cwd=$(pwd)
cd $tempdir

mod_dir=""
if [ -d "$FACTORIO_MOD_DIR" ]; then
  mod_dir=$FACTORIO_MOD_DIR
else
  mod_dir=$cwd
fi

zip -r "${mod_dir}/${archive_name}" "${mod_name}_${mod_version}"

cd $cwd

rm -R $tempdir
