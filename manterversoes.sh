#!/bin/bash

#aqui estou vendo quantas versões existem
version=$(gcloud secrets versions list nomedoSecret --project idProjeto | grep enabled |sort -n | awk '{print$1}' | wc -l)

#apenas um contador
versao=1

#aqui estou pegando o número da penultima versão pra manter apenas 2
manter=$(gcloud secrets versions list nomedoSecret --project idProjeto | head -3 | tail -1| awk '{print$1}')

#echo nas variaveis
echo $version
echo $manter
echo $versao

while [ $versao -lt $manter ]
do
  gcloud secrets versions destroy $versao --secret=test123 --project active-chimera-359118 --quiet
  versao=$[$versao +1]
done

echo $version
echo $manter
