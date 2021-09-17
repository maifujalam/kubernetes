1. Create a service account name:  dns01-solver
2. Assign dns admin role to this SA.
3. Download json key for this SA.
4. Create secret with key (checkout the namespace):     kubectl -n cert-manager create secret generic clouddns-dns01-solver-svc-acct --from-file=key.json
5. Create Issuer or ClusterIssuer: 