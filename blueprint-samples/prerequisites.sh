#!/usr/bin/env bash
# script to ensure pip, opera and ansible roles are installed
# it also copies sodalite modules and creates / copies certs

component_name="$1"
ca_crt_dir="$2"

[[ ! -d "blueprints/$component_name" ]] && echo "Blueprint $component_name does not exist!" && exit 1


PIP_INSTALLED=$(command -v pip3)
if [ -z "$PIP_INSTALLED" ]; then
    echo
    echo
    read -r -p "pip3 is not installed. Do you wish to update and install pip? " ynp
    if [ "$ynp" != "${ynp#[Yy]}" ] ;then
        echo
        echo "Installing pip3"
    else
        echo
        echo "Abort."
        return
    fi
    sudo apt update
    sudo apt install -y python3 python3-pip
fi

OPERA_INSTALLED=$(pip3 show opera)

if [ -z "$OPERA_INSTALLED" ]; then
    echo
    echo
    read -r -p "xOpera is not installed. Do you wish to update and install xOpera and required packages? " yn
    if [ "$yn" != "${yn#[Yy]}" ] ;then
        echo
        echo "Installing xOpera"
    else
        echo
        echo "Abort."
        return
    fi
    sudo apt update
    sudo apt install -y python3-venv python3-wheel python-wheel-common
    sudo apt install -y ansible
    python3 -m venv --system-site-packages .venv && . .venv/bin/activate
    pip3 install opera
fi

echo
echo "Installing required Ansible roles"
ansible-galaxy install -r ./requirements.yml

echo
echo "Cloning iac modules"

rm -rf "blueprints/$component_name/modules"
git clone https://github.com/SODALITE-EU/iac-modules.git "blueprints/$component_name/modules"

if [[ "$component_name" = "docker-registry" ]]  || [[ "$component_name" = "xOpera-REST-API" ]]; then

  echo
  echo
  echo "These are basic minimal inputs. If more advanced inputs are required please edit blueprints/$component_name/input.yaml file manually."
  echo
  echo "Please enter email for SODALITE certificate: "
  read -r EMAIL_INPUT
  export SODALITE_EMAIL=$EMAIL_INPUT

  envsubst < "./blueprints/$component_name/input.yaml.tmpl" > "./blueprints/$component_name/input.yaml"

  artifacts_path="blueprints/$component_name/modules/docker/artifacts"
  mkdir "$artifacts_path"

  CA_KEY="$artifacts_path/ca.key"
  CA_CRT="$artifacts_path/ca.crt"

  if [ -z "$ca_crt_dir" ]; then
    echo
    echo "Did not provide path to dir with ca.key and ca.crt, generating... "

    openssl genrsa -out "$CA_KEY" 4096
    openssl req -new -x509 -key "$CA_KEY" -out "$CA_CRT" -subj "/C=SI/O=XLAB/CN=$SODALITE_EMAIL" 2>/dev/null

  else
    echo
    echo "Copying ca.key and ca.crt files..."
    cp "$ca_crt_dir/ca.key" "$artifacts_path"
    cp "$ca_crt_dir/ca.crt" "$artifacts_path"
  fi

  echo "Generating client certs..."
  client_key="$artifacts_path/client.key"
  client_crt="$artifacts_path/client.cert"
  client_csr="$artifacts_path/client.csr"
  openssl genrsa -out "$client_key" 4096 || exit
  echo "key ok"
  openssl req -new -sha256 -key "$client_key" -subj "/C=SL/O=XLAB/CN=$SODALITE_EMAIL" -out "$client_csr" || exit
  echo "csr ok"
  openssl x509 -req -in "$client_csr" -CA "$CA_CRT" -CAkey "$CA_KEY" -CAcreateserial -out "$client_crt" -days 800 -sha256 || exit
  rm "$client_csr"
  echo "Client certs for connection are located in $artifacts_path. They must be copied to /etc/docker/certs.d/[registry_ip]."


fi




