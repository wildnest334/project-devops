#  Proyecto DevOps: Automatización y Despliegue en AWS

##  Descripción del proyecto

Este proyecto implementa una solución de automatización en AWS aplicando principios de DevOps. Se desarrolló un flujo completo que permite:

* Gestión de instancias EC2 mediante Python (boto3)
* Respaldo de archivos en S3 mediante Bash
* Control de versiones con Git y GitHub
* Simulación de un flujo CI/CD mediante un script de orquestación
* Uso de configuración externa para evitar hardcoding

El sistema permite ejecutar procesos automatizados que interactúan con servicios de AWS de forma eficiente y reutilizable.

---

##  Tecnologías utilizadas

* Python 3 + boto3
* Bash scripting
* AWS EC2
* AWS S3
* AWS CLI
* Git & GitHub

---

##  Estructura del proyecto

```
project-devops/
│
├── ec2/
│   └── gestionar_ec2.py
│
├── s3/
│   └── backup_s3.sh
│
├── logs/
│
├── config/
│   └── config.env
│
├── deploy.sh
│
└── README.md
```

---

##  Instrucciones de uso

###  1. Clonar repositorio

```bash
git clone <url-del-repositorio>
cd project-devops
```

---

###  2. Configurar variables

Editar el archivo:

```bash
config/config.env
```

Ejemplo:

```bash
INSTANCE_ID=i-xxxxxxxxxxxx
BUCKET_NAME=mi-bucket-devops
DIRECTORY=ec2
REGION=us-east-1
```

---

###  3. Ejecutar el pipeline

#### Con parámetros:

```bash
./deploy.sh iniciar i-123456 ec2 mi-bucket-devops
```

#### Sin parámetros (usa config):

```bash
./deploy.sh
```

---

## Flujo DevOps implementado

```
Feature → Commit → Push → Merge → Deploy → AWS
```

1. Se desarrollan funcionalidades en ramas `feature/*`
2. Se realizan commits progresivos
3. Se hace push a GitHub
4. Se realiza merge a `develop` y luego a `main`
5. Se ejecuta el script `deploy.sh`
6. Se automatiza la ejecución en AWS

---

##  Ejemplos de uso

###  Listar instancias EC2

```bash
python3 ec2/gestionar_ec2.py listar
```

---

### 🔹 Iniciar instancia

```bash
python3 ec2/gestionar_ec2.py iniciar i-123456
```

---

###  Ejecutar backup manual

```bash
./s3/backup_s3.sh ec2 mi-bucket-devops
```

---

###  Ejecutar pipeline completo

```bash
./deploy.sh iniciar i-123456 ec2 mi-bucket-devops
```

---

##  Validaciones realizadas

* Ejecución correcta del pipeline
* Cambio de estado en instancias EC2
* Generación y subida de archivos a S3
* Registro de logs en carpeta `logs/`

---

##  Buenas prácticas aplicadas

* Separación de configuración (`config.env`)
* Eliminación de hardcoding
* Scripts reutilizables
* Manejo de errores
* Logs para trazabilidad
* Flujo de trabajo con Git (branching strategy)

---

##  Autor

Ariel Martínez

---

##  Conclusión

Se logró implementar un flujo automatizado basado en principios DevOps, integrando servicios de AWS y herramientas de desarrollo. El proyecto demuestra la capacidad de automatizar procesos, gestionar infraestructura y aplicar buenas prácticas en entornos reales.

---
