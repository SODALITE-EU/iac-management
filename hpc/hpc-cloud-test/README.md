# TOSCA example for HPC - Cloud cross platform interaction          

This example is a simple “hello world” xOpera Blueprint to demonstrate HPC/Cloud data transfer. 
* It set up a TORQUE job that produces a simple audit file as a result
* Starts this job
* Create an Openstack VM that will act as a destination server
* Awaits for TORQUE job to finish
* Copies produced audit file to the Openstack VM