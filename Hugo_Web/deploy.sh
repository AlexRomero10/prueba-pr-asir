#!/bin/bash

# Directorio del repositorio de desarrollo (donde está tu proyecto Hugo)
DEV_REPO=~/github/Hugo_Web

# Directorio del repositorio de despliegue (donde se publicará tu sitio)
DEPLOY_REPO=~/github/AlexRomero10.github.io

# Navegar al repositorio de desarrollo
cd "$DEV_REPO" || { echo "Error: No se pudo acceder al directorio de desarrollo."; exit 1; }

# Añadir todos los cambios, incluyendo los archivos no rastreados
git add . || { echo "Error: No se pudieron agregar los cambios."; exit 1; }

# Realizar commit con un mensaje automático
git commit -m "Actualización del sitio $(date)" || { echo "Error: No hay cambios para agregar."; exit 1; }

# Construir el sitio Hugo
hugo || { echo "Error: Fallo en la generación del sitio con Hugo."; exit 1; }

# Copiar la carpeta public al repositorio de despliegue
rm -rf "$DEPLOY_REPO/*" || { echo "Error: No se pudo limpiar el directorio de despliegue."; exit 1; }
cp -R public/* "$DEPLOY_REPO/" || { echo "Error: No se pudo copiar los archivos al directorio de despliegue."; exit 1; }

# Navegar al repositorio de despliegue
cd "$DEPLOY_REPO" || { echo "Error: No se pudo acceder al directorio de despliegue."; exit 1; }

# Añadir todos los cambios en el repositorio de despliegue
git add . || { echo "Error: No se pudieron agregar los cambios en el repositorio de despliegue."; exit 1; }

# Realizar commit con un mensaje
git commit -m "Actualización del sitio desplegado $(date)" || { echo "Error: No hay cambios para agregar en el despliegue."; exit 1; }

# Push de los cambios
git push origin main || { echo "Error: Fallo al hacer push en el repositorio de despliegue."; exit 1; }

# Volver al repositorio de desarrollo y hacer push
cd "$DEV_REPO" || { echo "Error: No se pudo volver al directorio de desarrollo."; exit 1; }
git push origin main || { echo "Error: Fallo al hacer push en el repositorio de desarrollo."; exit 1; }

echo "Despliegue completado con éxito."
