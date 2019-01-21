<!-- TOC -->

- [How to provide namespaced acces to a `service account` of other namespace?](#how-to-provide-namespaced-acces-to-a-service-account-of-other-namespace)

<!-- /TOC -->
### How to provide namespaced acces to a `service account` of other namespace?

Let, we have two namespaces **A** and **B**. We want to provide access of some resources of namespace **B** to a `service account` of namespace **A**.

*Solution:* Create a `RoleBinding` in namespace **B** with subject pointing to `service account` of namespace **A**.

```yaml
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: demo
  namespace: B
subjects:
- kind: ServiceAccount
  name: demo-sa
  namespace: A
roleRef:
  kind: Role
  name: demo-role
  apiGroup: rbac.authorization.k8s.io
```