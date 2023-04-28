
View log from Pod
```commandline
kubectl logs <pod_name> --all-containers
```

To see the labels automatically generated for each Pod
```commandline
kubectl get pods --show-labels
```

Enter to container
```commandline
kubectl exec -it <pod-name>" -- bash
```


Get Env from Pod
```commandline
kubectl exec envar-demo -- printenv
```

Detailed Pod info
```commandline
kubectl describe <some_pod>
```

Restart pods in deployment
```commandline
kubectl rollout restart deployment <deployment_name>
```

Delete resource
```commandline
kubectl delete deployment --all
```

Returns the Kubernetes URL(s) for service(s) in your local cluster.
```commandline
minikube service <service_name>
```
