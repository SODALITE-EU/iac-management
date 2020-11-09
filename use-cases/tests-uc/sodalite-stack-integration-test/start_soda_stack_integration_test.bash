# NOTE THAT THIS CAN TAKE UP TO AN HOUR TO DEPLOY!
# use opera==0.6.2 or newer
/usr/bin/time -p opera undeploy
rm -rf .opera
/usr/bin/time -p opera deploy full_test.yaml -i tests/input.yaml
opera outputs