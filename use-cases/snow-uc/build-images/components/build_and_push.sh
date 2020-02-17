#!/bin/bash
registry_ip="$1"
tag="$2"

if [[ -z "$registry_ip" || "$1" == "-h" ]]; then
  echo "Build, tag and push docker images to docker registry."
  echo "Usage: ./$(basename "$0") [registry_ip] [(optional) image_tag]"
  exit
fi

for path in "$PWD"/* ; do
  if [[ -d $path ]]; then

    cd "$path" || return
    component=$(basename "$path")

    echo Building "$component"...

    image_tag=snow-"$component"

    if [[ -n "$tag" ]]; then
      image_tag="$image_tag":"$tag"
    fi

    docker build -t "$image_tag" . || exit
    docker tag "$image_tag" "$registry_ip"/"$image_tag"
    docker push "$registry_ip"/"$image_tag" || exit

    cd .. || return
  fi
done

echo Done