#!/bin/bash

log=kube-burner-$(date +"%F-%T").out

for test in node-density ; do
	echo $test ;
	for i in 3000  ; do
		QPS=50 BURST=50 PRELOAD_IMAGES=false CLEANUP_WHEN_FINISH=true PODS_PER_NODE=$i WORKLOAD=$test ./run.sh ;
 		echo "$(date -u) Sleeping for 10m"
		sleep 10m ;
	done ;
done 2>&1 | tee -a $log

# single namespace
# for test in node-density-cni ; do
# 	echo $test ;
# 	for i in 1500  ; do
# 		NAMESPACED_ITERATIONS=false PRELOAD_IMAGES=false CLEANUP_WHEN_FINISH=true PODS_PER_NODE=$i WORKLOAD=$test ./run.sh ;
# 		echo "$(date -u) Sleeping for 10m"
# 		sleep 10m ;
# 	done ;
# done 2>&1 | tee -a $log

# namespaced
#for test in node-density-cni ; do
#	echo $test ;
#	for i in 2500  ; do
#		NAMESPACED_ITERATIONS=true PRELOAD_IMAGES=false QPS=50 BURST=50 CLEANUP_WHEN_FINISH=true PODS_PER_NODE=$i WORKLOAD=$test ./run.sh ;
#		echo "$(date -u) Sleeping for 10m"
#		sleep 10m ;
#	done ;
#done 2>&1 | tee -a $log

# namespaced
#for test in node-density-cni ; do
#	echo $test ;
#	for i in 2000  ; do
#		NAMESPACED_ITERATIONS=true PRELOAD_IMAGES=false CLEANUP_WHEN_FINISH=true PODS_PER_NODE=$i WORKLOAD=$test ./run.sh ;
#		echo "$(date -u) Sleeping for 10m"
#		sleep 10m ;
#	done ;
#done 2>&1 | tee -a $log

#for test in cluster-density ; do
#	echo $test ;
#	for i in 4000 ; do
#		QPS=50 BURST=50 NAMESPACED_ITERATIONS=true PRELOAD_IMAGES=false CLEANUP_WHEN_FINISH=true JOB_ITERATIONS=$i WORKLOAD=$test ./run.sh ;
#		echo "$(date -u) Sleeping for 10m"
#		sleep 10m ;
#	done ;
#done 2>&1 | tee -a $log

#for test in node-density ; do
#	echo $test ;
#	for i in 2500  ; do
#		NODE_COUNT=3 PRELOAD_IMAGES=false CLEANUP_WHEN_FINISH=true PODS_PER_NODE=$i WORKLOAD=$test ./run.sh ;
# 		echo "$(date -u) Sleeping for 10m"
#		sleep 10m ;
#	done ;
#done 2>&1 | tee -a $log
#
#for test in pod-density-heavy ; do
#	echo $test ;
#	for i in 450 1050  ; do
#		PRELOAD_IMAGES=false CLEANUP_WHEN_FINISH=true PODS_PER_NODE=$i WORKLOAD=$test ./run.sh ;
#		echo "$(date -u) Sleeping for 10m"
#		sleep 10m ;
#	done ;
#done 2>&1 | tee -a $log

#for test in cluster-density ; do
#	echo $test ;
#	for i in 3500 ; do
#		QPS=50 BURST=50 NAMESPACED_ITERATIONS=true PRELOAD_IMAGES=false CLEANUP_WHEN_FINISH=true JOB_ITERATIONS=$i WORKLOAD=$test ./run.sh ;
#		echo "$(date -u) Sleeping for 10m"
#		sleep 10m ;
#	done ;
#done 2>&1 | tee -a $log
#for test in node-density-{cni,heavy} ; do
#	echo $test ;
#	for i in 2000 ; do
#		NAMESPACED_ITERATIONS=true PRELOAD_IMAGES=false CLEANUP_WHEN_FINISH=true PODS_PER_NODE=$i WORKLOAD=$test ./run.sh ;
#               echo "$(date -u) Sleeping for 10m"
#		sleep 10m ;
#	done ;
#done 2>&1 | tee -a $log
