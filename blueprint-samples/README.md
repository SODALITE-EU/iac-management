# SODALITE xOpera sample blueprints

Collection of xOpera sample blueprints. Currently, sample blueprints are available for SODALITE cloud testbed (openstack). 

## List of sample blueprints
### hello
Local blueprint. Creates/deletes file `/tmp/playing-opera/hello/hello.txt` on local computer. Takes under 20s to complete.
### nginx_openstack
Blueprint deploys centos VM to openstack with simple html website on nginx server. Usually takes 1-2 min to complete.
### nginx_openstack-modify
Blueprint modifies website, created during nginx_openstack deployment. It can also be deployed independently, without previous nginx_openstack deployment. It takes 1-2 min to complete
### xOpera-REST-API
Blueprint deploys complete functional xOpera REST API stack to openstack, formed of centos VM, with xopera-flask, xopera-nginx and xopera-postgres containers. It takes 5-10 minutes. Before deployment, prerequisits.sh script must be run with `./prerequisits.sh xOpera-REST-API <CA-dir>` to copy modules and configure certs.
### docker-registry
Blueprint for deployment of docker registry. Before deployment, prerequisits.sh script must be run with `./prerequisits.sh xOpera-REST-API <CA-dir>` to copy modules and configure certs.
### postgresql
Blueprint for deployment of postgresql container on centos VM. Before deployment, prerequisits.sh script must be run with `./prerequisits.sh xOpera-REST-API` to copy SODALITE modules. Certs are not needed with this blueprint, so param `<CA-dir>` used with prerequisits script before docker-registry and xOpera-REST-API blueprints is ommited here.  
### sodalite-test
BLueprint with POC sodalite stack. Sample modules are already in place, can be run without `prerequisits.sh` script.
