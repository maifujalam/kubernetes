Notes:-
1. when no tls is provided in ingress ,it uses inbuilt self-signed certificate.
2. If tls is provided then it should match with secretes host and rules host.
3. Common name may not be same as dns name.
4. Default expiry of issued certificate is 3 months,and renew period is 2/3 of default duration,i.e 2 after months.
5. ingress has to be in same namespace of certificate, because certificate generates secret in the namespace of certificate.
    Issuer,Service,ingress,secret,certificate has to be in same namespace.
6. isCA makes certificate eligible to sign other certificate.
7. Don't expose ingress services as node port.
8. can have multiple dns name everywhere (certificate,ingress) but not ip address.
9. Assign static gcp vm ip to ingress external ip.
10. while making cloud dns record make sure to choose below options
        a. Cloud DNS: It is managed by Cloud DNS from console.google.com UI.
        b. Google Domains: It needs to be managed into different UI i.e  domains.google.com
11. Make sure to verify cloud name server in both cloud domain and (Cloud DNS| Google Domains).
12. Rule: skalam.info	     A	    1 hour	 35.200.228.26
          www.skalam.info	CNAME	1 hour	 skalam.info.
13. Verify domain is resolved or not at : https://check-host.net/check-dns
14. TO REMOVE CERTIFICATE:- Remove certificate,secret,ingress.
15. Multiple ingress of same dns will take the latest ingress.
16. WARNING:- ALWAYS REMOVE SECRET WHILE REMOVING CERTIFICATE
17. HTTP01 Challenge does not support wildcard(*) symbol.