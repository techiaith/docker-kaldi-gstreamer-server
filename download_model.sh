#!/bin/bash

MODELS_URL=http://techiaith.cymru/kaldi/decoders
model_name=$1
dest_dir=models/$model_name

mkdir -p $dest_dir

echo "---- Downloading language model.... ----"
wget -P ${dest_dir} -N -q -nd -c -e robots=off -r -np ${MODELS_URL}/${model_name}.tar.gz || { echo "WGET Error"'!' ; exit 1 ; }
echo "---- Finished downloading testing audio ----"

echo "---- Unzipping ${lm_name}.tar.gz  in ${dest_dir} ----"
cd ${dest_dir}
tar -zxf ${model_name}.tar.gz 
cd -

rm ${dest_dir}/${model_name}.tar.gz 

cp -v template.yaml $dest_dir/$model_name.yaml || { echo "yaml error"; exit 1; }

