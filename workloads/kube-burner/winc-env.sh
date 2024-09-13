export QPS=5
export BURST=5
export WORKLOAD=node-density
export PODS_PER_NODE=245
export NODE_COUNT=9
export JOB_TIMEOUT=18000
export CLEANUP_WHEN_FINISH=false
export POD_NODE_SELECTOR='{kubernetes.io/os: windows}'
export NODE_POD_DENSITY_IMAGE=mcr.microsoft.com/oss/kubernetes/pause:3.6
export POD_WORKLOAD_LABEL_SELECTOR=kubernetes.io/os=windows
export POD_TOLERATIONS='[{key: os, value: Windows, Effect: NoSchedule}]'
export NODE_SELECTOR='{node-role.kubernetes.io/workload: }'
export METRICS_PROFILE='metrics-profiles/metrics-ovn.yaml'
