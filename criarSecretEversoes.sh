#!/bin/bash

printf "senha nova"| gcloud secrets create nomedoSecret --data-file=- --replication-policy=user-managed --locations=us-central1 --project idProjeto

criar=1

while [ $criar -lt 6 ]
do
  printf "senha nova"| gcloud secrets versions add nomedoSecret --data-file=- --project idProjeto --quiet
  criar=$[$criar +1]
done
