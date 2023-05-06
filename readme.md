## Django project template to run in k8s

#### Steps to reproduce

Start local cluster - minikube
```commandline
minikube start
```

Enable ingress-controller
```commandline
minikube addons enable ingress
```

Get minikube ip
```commandline
minikube ip
```

Add host name ``app-test.com`` with local cluster ip to local storage
```commandline
sudo vim /etc/hosts
```

Apply k8s manifests (configs, storages, services, deployments, ingress)
```commandline
kubectl apply -f ./kube/../<manifest-name.yml>
```

Make migrations
```commandline
kubectl apply -f ./kube/jobs/migration.yml
```

View App start page by the link [http://app-test.com/](http://app-test.com/)

### Additional commands

Check that all resources have been created
```commandline
kubectl get all
```

Get detailed info about Pod
```commandline
kubectl get pod <pod_name>  --output=yaml
```

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

Enter to specific container in the pod (Multi-Container Pods)
```commandline
kubectl exec -it <pod-name> -c nginx-for-django-temp -- bash
```

Get Env from Pod
```commandline
kubectl exec <pod-name> -- printenv
```

Detailed Pod info
```commandline
kubectl describe <pod-name>
```

Restart pods in deployment
```commandline
kubectl rollout restart deployment <deployment_name>
```


Delete resource
```commandline
kubectl delete deployment --all
```

Delete all resources
```commandline
kubectl delete all --all -n {namespace}
```

### Additional minikube commands

Returns the Kubernetes URL(s) for service(s) in your local cluster.
```commandline
minikube service <service_name>
```

List all minikube addons
```commandline
minikube addons list
```
