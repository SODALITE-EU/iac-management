prepare-artifacts:
	cp -r artifacts/certs/* modules/hpc/data/mover/artifacts/certs/ && \
	cp -r artifacts/data/* modules/hpc/data/mover/artifacts/data/ && \
	cp -r artifacts/jobs/* modules/hpc/torque/torque-job/artifacts/jobs/

deploy:
	opera deploy -i inputs.yml service.yml

undeploy:
	opera undeploy

outputs-json:
	opera outputs --format json

outputs-yaml:
	opera outputs --format yaml

clean:
	rm -rf .opera

clean-all:
	rm -rf .opera && sed -i 's/:.*/:/' inputs.yml