
<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [Some Tricks](#some-tricks)
  - [Container](#container)
    - [Inject an Executable Script into a Container](#inject-an-executable-script-into-a-container)
  - [Commands](#commands)
    - [See log of the pods that match a pattern](#see-log-of-the-pods-that-match-a-pattern)
    - [See logs of all container in a pod](#see-logs-of-all-container-in-a-pod)
    - [See logs of a container that has crashed](#see-logs-of-a-container-that-has-crashed)

<!-- /code_chunk_output -->


# Some Tricks

Here, I will note some kubernetes tricks.

## Container

### Inject an Executable Script into a Container

Let's we want to execute a script inside a container. The script is not not a part of the docker image. We have to inject script then execute it.

**Solution:**

1. Create a configMap with the script.
2. Mount the configMap to the container as a volume with `defaultMode: 0744`.
3. Use `command:["/path/to/the/script.sh"]` to run the script.

**Example:**

```yaml
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: ghost
  labels:
    role: blog
spec:
  replicas: 1
  template:
    metadata:
      labels:
        role: blog
    spec:
      containers:
      - name: ghost
        image: ghost:0.11-alpine
        command: ["/scripts/wrapper.sh"]
        ports:
        - name: ghost
          containerPort: 2368
          protocol: TCP
        volumeMounts:
        - name: wrapper
          mountPath: /scripts
      volumes:
      - name: wrapper
        configMap:
          name: wrapper
          defaultMode: 0744
```

Ref: http://blog.phymata.com/2017/07/29/inject-an-executable-script-into-a-container-in-kubernetes/

## Commands

Here, goes some command tricks.

### See log of the pods that match a pattern

**Format:**

```console
kubectl logs -n <namespace> $(kubectl get pod -n <namespace> |  awk '/<pattern>/{print $1}') -f
```

**Example:**

```console
kubectl logs -n kube-system $(kubectl get pod -n kube-system |  awk '/kube-proxy*/{print $1}') -f
```

### See logs of all container in a pod

Use `--all-containers` flag.

```console
kubectl logs my-pod --all-containers
```

### See logs of a container that has crashed

Use `--previous` (short `-p`) flag.

```console
kubectl logs my-pod --previous
```
