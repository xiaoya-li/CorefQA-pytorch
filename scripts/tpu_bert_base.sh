#!/usr/bin/env python3 
# -*- coding: utf-8 -*- 

REPO_PATH=/mnt/data/CorefQA-pytorch
export PYTHONPATH="$PYTHONPATH:/mnt/data/CorefQA-pytorch"
export TPU_IP_ADDRESS=10.173.250.154
export XRT_TPU_CONFIG="tpu_worker;0;$TPU_IP_ADDRESS:8470"



EXP_ID=22_1
FOLDER_PATH=/mnt/data/CorefQA-pytorch
CONFIG_PATH=${FOLDER_PATH}/config/gpu_spanbert.yml
DATA_PATH=/mnt/data/tpu-data/data
BERT_PATH=/mnt/data/ckpt/spanbert_base
output_path=/mnt/data/ckpt/spanbert_base


exp_id=2020.06.24_morn
config_name=spanbert_base
learning_rate=3e-5
dropout=0.2
num_train_epoch=20
eval_per_epoch=3
warmup_proportion=-1
gradient_accumulation_step=1
seed=2333
n_gpu=1
mention_chunk_size=15


python3 ${FOLDER_PATH}/run/train.py \
--n_gpu ${n_gpu} \
--mention_chunk_size ${mention_chunk_size} \
--config_path ${CONFIG_PATH} \
--config_name ${config_name} \
--data_dir ${DATA_PATH} \
--bert_model ${BERT_PATH} \
--lr ${learning_rate} \
--eval_per_epoch ${eval_per_epoch} \
--warmup_proportion ${warmup_proportion} \
--num_train_epochs ${num_train_epoch} \
--seed ${seed} \
--output_dir ${output_path} \
--tpu 

