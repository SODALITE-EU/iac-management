# SODALITE xOpera sample blueprints

Collection of xOpera sample blueprints. Currently, sample blueprints are available for SODALITE cloud testbed (openstack). 

## List of sample blueprints
### hello-world
Local blueprint. Creates/deletes file `/tmp/playing-opera/hello/hello.txt` on REST API server. Takes under 20s to complete.
### nginx-test
Blueprint deploys centos 7 VM to openstack with simple html website on nginx server. Usually takes 1-2 min to complete.
### nginx-modify
Blueprint modifies website, created during nginx-test deployment. It can also be deployed independently, without previous nginx-test deployment. It takes 1-2 min to complete
### xopera-full
Blueprint deploys complete functional xOpera REST API stack to openstack, formed of three centos-7 VMs, one with xOpera REST server, another with docker registry and another with postgresql database. It takes 5-10 minutes.
### xopera-rest, postgresql, docker-registry
Components from xopera-full can also be deployed separately, from `xopera-rest`, `postgresql`, `docker-registry` sample blueprints.
`docker-registry` has to be installed as first component and all images, needed by following deployments (for instance, `xopera-rest`) must be uploaded.
if deploying `xopera-rest`, registry's IP address must be inserted into `xopera-rest/service.yaml` under `topology_blueprint/node_sample blueprints/docker/properties/registry_ip`. Postgresql is optional, since REST API can also work without database.

## xOpera via CLI
From blueprint dir, run:

    opera deploy [id] service.yaml

## xOpera via REST API
### Convert to JSON
REST API supports input blueprints in json format. For converting blueprints, use [blueprint2json tool](blueprint2json.py).
For more info about usage, check help: 

    blueprint2json.py --help
    
#### JSON blueprint samples
Sample blueprints in JSON format are located inside [blueprints-json](blueprints-json) dir.

    
### Sending request to REST API
WIP, endpoint may change, currently
    
    curl -H "Content-Type: application/json" -X "POST" --data-binary @json_file.json localhost:5000/manage

Check [api call to upload blueprint](upload_blueprint.http) or [all api calls](requests.http).

### Using xopera-key-name in templates

If template requires installing VM, xopera's key name must be set in template in order for xOpera to be able to connect to VM over SSH and configure VM.

The easiest way is to provide it with  `get_input` command:

    vm:
      type: my.nodes.VM.OpenStack
      properties:
        name: website-nginx-test
        image: centos7
        flavor: m1.medium
        network: orchestrator-net
        security_groups: default,sodalite-xopera-rest,sodalite-remote-access
        key_name: { get_input: xopera-key-name}

If get_input field name is set to `xopera-key-name`, rest api will automatically add it's own key name to inputs.
It can also be configured to custom get_input field name, but in this case, user must provide his own file with inputs.

    curl -X "POST" -F "inputs_file=@path/to/file.yaml" localhost:5000/deploy/567858fc-a1e8-43b4-91f5-cb04ec8be90b
See [api calls](requests.http) for more help.