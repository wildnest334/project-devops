#!/bin/bash

# Validación de parámetros
if [ "$#" -lt 4 ]; then
    echo "Uso: $0 <accion_ec2> <instance_id> <directorio> <bucket>"
    exit 1
fi

ACCION=$1
INSTANCE_ID=$2
DIRECTORIO=$3
BUCKET=$4

LOGS="logs/deploy.log"

# Crear carpeta de logs si no existe
mkdir -p logs

echo "Iniciando proceso de despliegue..." | tee -a $LOGS

# 🔹 Ejecutar script EC2 (Python)
echo "Ejecutando gestión de EC2..." | tee -a $LOGS

python3 ec2/gestionar_ec2.py $ACCION $INSTANCE_ID

if [ $? -ne 0 ]; then
    echo "Error en script EC2" | tee -a $LOGS
    exit 1
fi

echo "EC2 ejecutado correctamente" | tee -a $LOGS

# 🔹 Ejecutar backup S3
echo "Ejecutando backup en S3..." | tee -a $LOGS

./s3/backup_s3.sh $DIRECTORIO $BUCKET

if [ $? -ne 0 ]; then
    echo "Error en script S3" | tee -a $LOGS
    exit 1
fi

echo "Backup ejecutado correctamente" | tee -a $LOGS

echo "Proceso de despliegue finalizado correctamente" | tee -a $LOGS



    if comando == "listar":
        listar_instancias()

    elif comando == "iniciar" and len(sys.argv) == 3:
        iniciar_instancia(sys.argv[2])

    elif comando == "detener" and len(sys.argv) == 3:
        detener_instancia(sys.argv[2])

    elif comando == "terminar" and len(sys.argv) == 3:
        terminar_instancia(sys.argv[2])



if __name__ == "__main__":

        if comando == "listar":
            listar_instancias()

        elif comando == "iniciar" and len(sys.argv) == 3:
            iniciar_instancia(sys.argv[2])

        elif comando == "detener" and len(sys.argv) == 3:
            detener_instancia(sys.argv[2])

        elif comando == "terminar" and len(sys.argv) == 3:
            terminar_instancia(sys.argv[2])

        else:
            print("Comando no válido")

    # 🔹 Si no hay argumentos → menú interactivo
    else:
        main()

