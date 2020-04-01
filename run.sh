#!/bin/bash
HADOOP_bin='/your/path/hadoop-2.7.3/bin/hadoop'
INPUT_PATH="input_data"
OUTPUT_PATH="test"

$HADOOP_bin fs -rmr $OUTPUT_PATH


$HADOOP_bin jar /your/path/hadoop-2.7.3/share/hadoop/tools/lib/hadoop-streaming-2.7.3.jar\
    -D mapred.job.priority="VERY_HIGH"\
    -D mapred.reduce.tasks=200\
    -D mapreduce.job.queuename=root.online.default\
    -D mapred.job.map.capacity=400\
    -D mapred.job.reduce.capacity=100\
    -D mapred.job.name="test"\
    -D mapred.textoutputformat.ignoreseparator="true"\
    -input ${INPUT_PATH} \
    -output ${OUTPUT_PATH} \
    -file ./mapper.py\
    -file ./reducer.py\
    -partitioner "org.apache.hadoop.mapred.lib.HashPartitioner"\
    -mapper "python mapper.py"\
    -reducer "python reducer.py"\
    -inputformat "org.apache.hadoop.mapred.TextInputFormat"\
    -outputformat "org.apache.hadoop.mapred.TextOutputFormat"\