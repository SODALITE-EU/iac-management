# to allow brace expansion
SHELL=/bin/bash

# Prepare part
clinical:
	rsync -av \
	    --include=modules/hpc \
	    --include=modules/openstack \
	    --exclude=modules/* \
	    modules clinical-uc/hpc-clinical-uc/

data-mover:
	rsync -av \
	    --include=modules/hpc \
	    --include=modules/openstack \
	    --exclude=modules/* \
	    modules clinical-uc/data-mover/

modak:
	rsync -av \
	    --include=modules/hpc \
	    --exclude=modules/* \
	    modules clinical-uc/solver-modak/

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

clean-data-mover:
	rm -rf clinical-uc/data-mover/modules

clean-modak:
	rm -rf clinical-uc/solver-modak/modules

clean-vehicle:
	rm -rf vehicleiot-uc/full-demo/modules

clean-snow:
	rm -rf snow-uc/snow-demo/modules

clean-egi:
	rm -rf egi/modules

clean-all: clean-clinical clean-vehicle clean-snow clean-egi clean-modak