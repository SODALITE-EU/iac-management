*.yml: *.yml.tmpl
	./prepare.sh

deploy: *.yml.tmpl *.yml
	./deploy.sh

outputs-json:
	opera outputs --format json

outputs-yaml:
	opera outputs --format yaml

clean:
	rm -rf .opera inputs.yml service.yml