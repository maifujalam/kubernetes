**WireGuard**  
Wireguard is an inflight encryption provided by calico.

**Enable WireGuard By using following configs:-**
1. Patch felixconfiguration: a. calicoctl patch felixconfiguration default --type='merge' -p '{"spec":{"wireguardEnabled":true}}'   OR
                             b. kubectl patch felixconfiguration default --type='merge' -p '{"spec":{"wireguardEnabled":true}}'
2. Check felixconfiguration setting: k get felixconfigurations default -o yaml  (Note: WireGuard enabled)
3. Check wireguard key: calicoctl get node node1 -o yaml
4. Check wireguard interface: ip addr | grep wireguar
5. NOTE: Linux kernel 5.6.x introduce default wireguard package.So,vagrant or multipass may not have wireguard pre installed.So inflight encryption may not work.


Disable wireguard:
1. Patch felixconfiguration to disable wireguard: a. calicoctl patch felixconfiguration default --type='merge' -p '{"spec":{"wireguardEnabled":false}}'  OR
                                                  b. kubectl patch felixconfiguration default --type='merge' -p '{"spec":{"wireguardEnabled":true}}'
2. Check felixconfiguration setting: k get felixconfigurations default -o yaml  (Note: WireGuard is Disabled)