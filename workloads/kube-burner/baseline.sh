#!/bin/bash

log=kube-burner-$(date +"%F-%T").out

for test in node-density ; do
	echo $test ;
	for i in 100  ; do
		PRELOAD_IMAGES=true CLEANUP_WHEN_FINISH=true PODS_PER_NODE=$i WORKLOAD=$test ./run.sh ;
	done ;
done 2>&1 | tee -a $log

for test in pod-density-heavy ; do
	echo $test ;
	for i in 100  ; do
		PRELOAD_IMAGES=false CLEANUP_WHEN_FINISH=true PODS_PER_NODE=$i WORKLOAD=$test ./run.sh ;
	done ;
done 2>&1 | tee -a $log

# single namespace
for test in node-density-cni ; do
	echo $test ;
	for i in 100  ; do
		NAMESPACED_ITERATIONS=false PRELOAD_IMAGES=false CLEANUP_WHEN_FINISH=true PODS_PER_NODE=$i WORKLOAD=$test ./run.sh ;
		echo "$(date -u) Sleeping for 10m"
		sleep 10m ;
	done ;
done 2>&1 | tee -a $log

# namespaced
for test in node-density-{cni,heavy} ; do
	echo $test ;
	for i in 100  ; do
		NAMESPACED_ITERATIONS=true PRELOAD_IMAGES=true CLEANUP_WHEN_FINISH=true PODS_PER_NODE=$i WORKLOAD=$test ./run.sh ;
	done ;
done 2>&1 | tee -a $log

for test in cluster-density ; do
	echo $test ;
	for i in 100 ; do
		QPS=50 BURST=50 NAMESPACED_ITERATIONS=true PRELOAD_IMAGES=true CLEANUP_WHEN_FINISH=true JOB_ITERATIONS=$i WORKLOAD=$test ./run.sh ;
	done ;
done 2>&1 | tee -a $log
