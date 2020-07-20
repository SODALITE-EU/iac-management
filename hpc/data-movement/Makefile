deploy:
	opera deploy -i inputs.yml service.yml

outputs-json:
	opera outputs --format json

outputs-yaml:
	opera outputs --format yaml

clean:
	rm -rf .opera

clean-all:
	rm -rf .opera && sed -i 's/:.*/:/' inputs.yml