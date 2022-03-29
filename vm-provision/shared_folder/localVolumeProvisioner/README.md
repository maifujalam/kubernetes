**Interoduction**  
We are using hosts **/mnt/fast-disks** folder to create multiple mounts.Hare we are creating **/mnt/fast-disks/vol{1..3}** on
each nodes. This mounts will be consumed as Persistent Volume by Kubernetes.Its best used for creating StatefulSets.

**Local Volume Provisioner Pre-Requites**
1. Need to create sub folders at /mnt/fast-storage/vol{1..3}
2. Need to mount the above created subfolder as tempfs
3. So to make it run: create_mount.sh


**Steps to Install Local Volume Provisioner:-**  
1. Create /mnt/fast-disks/vol{1..3} (i.e Prerequisites) and mount it. `sh  create_mount.sh`
2. Install Local Storage Provisioner and Storage Class: `kubectl apply -f localVolumeProvisioner.yaml`
3. Verify Logs of all provisioner daemonSet,make sure it has created PV in logs : `k logs -f release-name-provisioner-xxx`
4. Verify all pv : `k get pv`

**Cleanup local provisioner.**  
1. Delete all pv,pvc,sc
2. Delete local localVolumeProvisioner deployment: `kubectl apply -f localVolumeProvisioner.yaml`
3. Unmount /mnt/fast-storage/vol{1..3} on each node: `umount /mnt/fast-disks/vol{1..3}`
4. Verify it is successfully unmounted on each node: ` mount | grep vol`
5. Delete files at /mnt/fast-storage/vol{1..3} on each node : `rm /mnt/fast-disks -rfv`


**StatefulSets (sts)**
1. It does not delete PV,PVC after deleting Sts.
2. Need to remove pvc first then pv.

[Note:- Once PV,PVC is created then it will not immediately be binding, because it is waiting for the pod to mount it first.
Due to Storage class policy WaitForFirstConsumer]