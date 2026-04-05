
# Script de gestión de EC2
import boto3

ec2 = boto3.client('ec2')

#  Funciones EC2
def listar_instancias():
    try:
        response = ec2.describe_instances()
        print("\n LISTA DE INSTANCIAS:\n")
        for reservation in response['Reservations']:
            for instance in reservation['Instances']:
                print(f"ID: {instance['InstanceId']}")
                print(f"Estado: {instance['State']['Name']}")
                print(f"Tipo: {instance['InstanceType']}")
                print("-" * 30)
    except Exception as e:
        print(f" Error al listar instancias: {e}")


def iniciar_instancia():
    instance_id = input(" Ingresa el ID de la instancia a iniciar: ")
    try:
        ec2.start_instances(InstanceIds=[instance_id])
        print(f" Instancia {instance_id} iniciada")
    except Exception as e:
        print(f" Error al iniciar: {e}")


def detener_instancia():
    instance_id = input(" Ingresa el ID de la instancia a detener: ")
    try:
        ec2.stop_instances(InstanceIds=[instance_id])
        print(f" Instancia {instance_id} detenida")
    except Exception as e:
        print(f" Error al detener: {e}")


def terminar_instancia():
    instance_id = input("ngresa el ID de la instancia a TERMINAR: ")
    confirm = input("¿Estás seguro? (si/no): ")

    if confirm.lower() == "si":
        try:
            ec2.terminate_instances(InstanceIds=[instance_id])
            print(f" Instancia {instance_id} terminada")
        except Exception as e:
            print(f" Error al terminar: {e}")
    else:
        print(" Operación cancelada")


#  Menú interactivo
def mostrar_menu():
    print("\n==============================")
    print("  GESTIÓN DE EC2 (DevOps)")
    print("==============================")
    print("1. Listar instancias")
    print("2. Iniciar instancia")
    print("3. Detener instancia")
    print("4. Terminar instancia")
    print("5. Salir")
    print("==============================")


def main():
    while True:
        mostrar_menu()
        opcion = input(" Selecciona una opción: ")

        if opcion == "1":
            listar_instancias()

        elif opcion == "2":
            iniciar_instancia()

        elif opcion == "3":
            detener_instancia()

        elif opcion == "4":
            terminar_instancia()

        elif opcion == "5":
            print(" Saliendo del programa...")
            break

        else:
            print(" Opción no válida, intenta de nuevo")


if __name__ == "__main__":
    main()
