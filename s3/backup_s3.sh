#!/bin/bash

# Validación de parámetros
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <directorio> <bucket>"
    exit 1
fi

DIRECTORIO=$1
BUCKET=$2
FECHA=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIVO="backup_$FECHA.tar.gz"
LOGS="logs/backup.log"

# Validar si el directorio existe
if [ ! -d "$DIRECTORIO" ]; then
    echo "Error: El directorio no existe" | tee -a $LOGS
    exit 1
fi

echo "Iniciando respaldo..." | tee -a $LOGS

# Comprimir archivos
tar -czf $ARCHIVO $DIRECTORIO

if [ $? -ne 0 ]; then
    echo "Error al comprimir archivos" | tee -a $LOGS
    exit 1
fi

echo "Compresión completada: $ARCHIVO" | tee -a $LOGS

# Subir a S3
aws s3 cp $ARCHIVO s3://$BUCKET/

if [ $? -ne 0 ]; then
    echo "Error al subir a S3" | tee -a $LOGS
    exit 1
fi

echo "Backup subido a S3: $BUCKET/$ARCHIVO" | tee -a $LOGS

# Limpieza opcional
rm $ARCHIVO

echo "Archivo local eliminado" | tee -a $LOGS

echo "Proceso finalizado correctamente" | tee -a $LOGS
