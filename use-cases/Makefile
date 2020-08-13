# to allow brace expansion
SHELL=/bin/bash

# Prepare part
clinical:
	rsync -av \
	    --include=modules/hpc \
	    --include=modules/openstack \
	    --exclude=modules/* \
	    modules clinical-uc/hpc-clinical-uc/

vehicle:
	rsync -av \
	    --exclude=modules/{hpc,tests} \
	    modules vehicleiot-uc/full-demo/

snow:
	rsync -av \
	    --exclude=modules/{hpc,tests} \
	    modules snow-uc/snow-demo/

egi-demo:
	rsync -av \
	    --exclude=modules/{hpc,tests} \
	    modules egi/

all: clinical vehicle snow egi

# Clean-up part
clean-clinical:
	rm -rf clinical-uc/hpc-clinical-uc/modules

clean-vehicle:
	rm -rf vehicleiot-uc/full-demo/modules

clean-snow:
	rm -rf snow-uc/snow-demo/modules

clean-egi:
	rm -rf egi/modules

clean-all: clean-clinical clean-vehicle clean-snow clean-egi