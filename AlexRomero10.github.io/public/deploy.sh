#!/bin/bash

# Variables
HUGO_DIR=~/github/Hugo_Web
GITHUB_REPO=~/github/AlexRomero10.github.io
BRANCH=main


cd $HUGO_DIR || exit
hugo
cd $GITHUB_REPO/public || exit
git add .
if ! git diff-index --quiet HEAD --; then
    git commit -m "Despliegue automático: $(date +'%Y-%m-%d %H:%M:%S')"
    git push origin $BRANCH
else
    echo "No hay cambios para desplegar."
fi
