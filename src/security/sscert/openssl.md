# Creating an SSL Certificate.

First create the private key for the new Certificate Authority:

	openssl genrsa -des3 -out CertificateAuthority.key 4096

After using the key we can generate the root certificate.  This certificate is the root certificate that we import into CA stores.

	openssl req -x509 -new -nodes -key CertificateAuthority.key -sha256 -days 365 -out CertificateAuthority.pem

Next we need to create a certificate signing request.  Once created we will request our new Certificate Authority to sign our new certificate.

	openssl genrsa -out server.key 4096

	openssl req -new -key server.key -out server.csr

Next we need to create a config file: config.cnf

	authorityKeyIdentifier=keyid,issuer
	basicConstraints=CA:FALSE
	keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
	subjectAltName = @alt_names

	[alt_names]
	DNS.1 = rock.lan

	openssl x509 -req -in server.csr -CA CertificateAuthority.pem -CAkey CertificateAuthority.key -CAcreateserial -out server.crt -days 360 -sha256 -extfile config.cnf
