*.yml: *.yml.tmpl
	./prepare.sh

deploy: *.yml.tmpl *.yml
	./deploy.sh

clean:
	rm -rf .opera inputs.yml service.yml