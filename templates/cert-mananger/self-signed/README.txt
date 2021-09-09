Notes:-
1. when no tls is provided in ingress ,it uses inbuilt self-signed certificate.
2. If tls is provided then it should match with secretes host and rules host.
3. Common name may not be same as dns name.
4. Default expiry of issued certificate is 3 months,and renew period is 2/3 of default duration,i.e 2 after months.
5. ingress has to be in same namespace of certificate, because certificate generates secret in the namespace of certificate.
6. isCA makes certificate eligible to sign other certificate.
7. Don't expose ingress services as node port.
8. can have multiple dns name everywhere (certificate,ingress) but not ip address.