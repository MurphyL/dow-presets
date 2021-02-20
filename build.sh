#!/bin/bash
set eux

WORK_DIR="/usr/murph"

ls -la ${WORK_DIR}/book

DOCS_OUT="${WORK_DIR}/serve"

BOOT_ROOT="${DOCS_OUT}/public"

rm -rf ${BOOT_ROOT}/*.md

mkdir -p ${BOOT_ROOT}

# 工作文档
work_docs=`find "${WORK_DIR}/work" -type f -name "jekyll.md"`

for doc in ${work_docs}
do
    cp -rf ${doc} "${BOOT_ROOT}/$(basename $(dirname ${doc})).md"
done  