#!/usr/env bash

echo "Hello from our devcontainer entrypoint!"

# docker-init.sh will start up the Docker Engine 

# . /usr/local/share/docker-init.sh

sudo git config --global core.autocrlf input


mkdir -p /home/node/.aws
ln -s /home/node/.aws /workspaces/aws-dms-deployment-using-aws-cdk/.aws
touch /home/node/.aws/credentials
sudo chmod -R 765 /home/node/.aws
sudo chown -R node /home/node/.aws
cat <<EOF > /home/node/.aws/credentials
[default]
sso_start_url = https://111111111111111.signin.aws.amazon.com/console
sso_region = us-east-1
sso_account_id = 111111111111111
sso_role_name = AWSAdministratorAccess
region = us-east-1
output = json
EOF

cat <<EOF > /home/node/.aws/config
[default]
output=json
region = us-east-1
EOF


exec "$@"