1. Create a service account name:  dns01-solver
2. Assign dns admin role to this SA.
3. Download json key for this SA.
4. Create secret with key ( WARNING:-):  
        4.1 For ClusterIssuer: this secret to be created in cert-manager namespace.Hare cert manager is installed in cert-manager namespace.
             kubectl -n cert-manager create secret generic clouddns-dns01-solver-svc-acct --from-file=key.json
        or
        4.2 For Issuer: this secret to be created in the issuer namespace
             kubectl -n {{issuer_namespace}} create secret generic clouddns-dns01-solver-svc-acct --from-file=key.json
5. Create Issuer or ClusterIssuer: Check Cluster issuer yaml
6. 