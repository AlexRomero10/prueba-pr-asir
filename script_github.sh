#!/bin/bash

# Cambiar al directorio del repositorio
cd ~/github/prueba-pr-asir || exit

# Cambiar a la rama principal
git checkout master

# Obtener cambios del repositorio original
git fetch upstream

# Combinar los cambios en la rama principal local
git merge upstream/main

# Subir los cambios a tu repositorio forkeado
git push origin main

echo "Sincronización completada."
