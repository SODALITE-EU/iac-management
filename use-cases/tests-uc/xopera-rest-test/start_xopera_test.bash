/usr/bin/time -p opera undeploy
rm -rf .opera
/usr/bin/time -p opera deploy xopera_test.yaml -i tests/input.yaml
opera outputs