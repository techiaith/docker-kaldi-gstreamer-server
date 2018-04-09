#!/bin/bash

src_dir=$1
model_name=$2

dest_dir=models/$model_name

mkdir -p $dest_dir

cp -v $src_dir/* $dest_dir || { echo "cp error"; exit 1; }
cp -v template.yaml $dest_dir/$model_name.yaml || { echo "yaml error"; exit 1; }
