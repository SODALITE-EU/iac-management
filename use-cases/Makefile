# to allow brace expansion
SHELL=/bin/bash

# Prepare part
clinical:
	rsync -av \
	    --include=modules/hpc \
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

all: clinical vehicle snow

# Clean-up part
clean-clinical:
	rm -rf clinical-uc/hpc-clinical-uc/modules

clean-vehicle:
	rm -rf vehicleiot-uc/full-demo/modules

clean-snow:
	rm -rf snow-uc/snow-demo/modules

clean-all: clean-clinical clean-vehicle clean-snow