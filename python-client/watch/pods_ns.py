from kubernetes import config, client,watch
config.load_config()
def main():
    # Configs can be set in Configuration class directly or using helper
    # utility. If no argument provided, the config will be loaded from
    # default location.
    config.load_kube_config()

    v1 = client.CoreV1Api()

    count = 10
    w = watch.Watch()
    for event in w.stream(v1.list_pod_for_all_namespaces,resource_version=None):
        print(event)
        print("Resource Verssion "+event['object'].metadata.resource_version)
        #print("Event: %s %s" % (event['type'], event['object'].metadata.name))
    print("Finished namespace stream.")

    # for event in w.stream(v1.list_pod_for_all_namespaces, timeout_seconds=10):
    #     print("Event: %s %s %s" % (
    #         event['type'],
    #         event['object'].kind,
    #         event['object'].metadata.name)
    #     )
    #     count -= 1
    #     if not count:
    #         w.stop()
    # print("Finished pod stream.")


if __name__ == '__main__':
    main()
