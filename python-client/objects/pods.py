# import kubernetes
#
# kubernetes.config.load_kube_config()
#
# v1 = kubernetes.client.CoreV1Api
# pods = v1.list_pod_for_all_namespaces(watch=False)
# for i in pods.items():
#     print(i)

from kubernetes import config, client,watch

config.load_config()
pods = client.CoreV1Api().list_pod_for_all_namespaces()
for i in pods.items:
    print(i.metadata.name)
