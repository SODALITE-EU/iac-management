# Pulling Docker Images from private and public registries and run with Singularity

In order to run this service one needs to specify frontend address, username and path to SSH key file in inputs.yaml. Prerequisite is to have certificates (ca.crt, client.cert and client.key) under properties:certs_location to access the private registry.