# IaC Management

SODALITE uses IaC, namely the well known Topology and Orchestration Specification for Cloud Applications [TOSCA](https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=tosca) OASIS standard for modelling the infrastructure and application deployment. The TOSCA lifecycle implementation interfaces are implemented in [Ansible](https://www.ansible.com/) playbooks and roles. 
This repository stores the TOSCA/Ansible blueprint examples that can be deployed with SODALITE orchestrator [xOpera](https://github.com/xlab-si/xopera-opera). 

The abstract deployment models are converted to intermediate IaC (TOSCA/Ansible) and deployed with the orchestrator to the targeted infrastructure. 

This repository contains the sample deployment blueprints for the SODALITE openstack cloud and HPC testbeds, as well as the initial deployments blueprints for demostrating use cases featured in the SODALITE project. 

NOTE: SODALITE currently uses the version xOpera version 0.1.7 since xOpera is beeing developed to support OASIS TOSCA Simple Profile in YAML version 1.3 standard currently in Public Review Draft.

## Prerequisites
The simplest way to run xOpera is to install it into virtual environment with openstack client setup:

```
$ mkdir ~/opera && cd ~/opera
$ python3 -m venv .venv && . .venv/bin/activate
(.venv) $ pip install "opera[openstack]<0.5"
```
Before using the OpenStack functionality through xOpera, obtaining OpenStack API access credentials is necessary. After logging into OpenStack Dashboard and navigating to the `Access & Security` -> `API Access page`, one can download the rc file with all required information.

At the start of each session (e.g., when we open a new command line console), sourcing of the rc file is needed by running:

    (venv) $ . openstack.rc

After entering the password, the orchestrator is ready to start using the OpenStack modules in playbooks that implement lifecycle operations.

### xOpera REST API
For easier integration within the SODALITE platform xOpera is exposed via a REST API. Information on how to setup and build the REST API can be found in the [SODALITE xopera-rest-api](https://github.com/SODALITE-EU/xopera-rest-api) repository.  

## Repository structure

### blueprint-samples
TOSCA/Ansible IaC blueprints targeting SODALITE cloud testbed (openstack) environment. As one of the main puproses of IaC is to provide deployment of various application types (heterogeneous applications) a deployment of xOpera REST API with several SODALITE system components are implemented through IaC and deployed with an xOpera orchestrator. 
`xopera-full` shows the IaC blueprint used to deploy the dockerized SODALITE ochestrator and TLS secured Image Registry on the SODALITE cloud testbed. 
### hpc
Collection of TOSCA/Ansible blueprints targeting SODALITE HPC Torque testbed environment.
### use-cases
SODALITE features [three demontrating use cases](https://sodalite.eu/use_cases) to prove value added for application deployment management through IaC. 
The `use-cases` directory contains sample TOSCA/Ansible IaC blueprints used for deploying demonstrating use case applications on the SODALITE cloud and HPC testbeds.  
