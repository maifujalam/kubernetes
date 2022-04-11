1. Default block all egress of pods.
2. Can be allowed if service account is tagged with allowed: `kubectl label serviceaccount -n yaobank customer internet-egress=allowed`
3. Can be denied if service account is tagged with denied: `kubectl label serviceaccount -n yaobank customer internet-egress=denyed`