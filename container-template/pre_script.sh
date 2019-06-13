#!/bin/bash
echo "this is the dockerstache pre render script"
echo "it runs in the following environment before rendering tempates"
printenv | grep DOCKERSTACHE

DIST_FILE=`ls -1t ../dist/rq_examples-*.tar.gz | head -1`
echo "DIST_FILE=${DIST_FILE}"
mkdir -p "${DOCKERSTACHE_OUTPUT_PATH}"
if [ ! -f "${DIST_FILE}" ]; then
    echo "No dist file ${DIST_FILE} found"
    echo "no dist" >> "${DOCKERSTACHE_OUTPUT_PATH}/rq_examples-latest.tar.gz"
else
    echo "copied to ${DOCKERSTACHE_OUTPUT_PATH}"
    cp ${DIST_FILE} "${DOCKERSTACHE_OUTPUT_PATH}/rq_examples-latest.tar.gz"
fi
