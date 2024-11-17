import os
import mysql.connector
from tabulate import tabulate

db = mysql.connector.connect(
    user="root",
    password="",
    host="localhost",
    database="tpfededbt"
    )

cursor = db.cursor()

def crear_usuario():
    nombre = input("Ingrese nombre: ")
    apellido = input("Ingrese apellido: ")
    dni = input("Ingrese DNI: ")
    telefono = input("Ingrese teléfono: ")
    email = input("Ingrese email: ")

    query = "INSERT INTO Usuarios (nombre, apellido, dni, telefono, email) VALUES (%s, %s, %s, %s, %s)"
    cursor.execute(query, (nombre, apellido, dni, telefono, email))
    db.commit()
    print("Usuario creado correctamente.")

def actualizar_estado_usuario():
    id_usuario = int(input("Ingrese ID del usuario a actualizar: "))
    estado = int(input("Ingrese nuevo estado (1=activo, 0=inactivo): "))

    query = "UPDATE Usuarios SET estado = %s, actualizado_el = NOW() WHERE id = %s"
    cursor.execute(query, (estado, id_usuario))
    db.commit()
    print("Estado del usuario actualizado correctamente.")

def inactivar_usuario():
    id_usuario = int(input("Ingrese ID del usuario a inactivar: "))
    
    query = "UPDATE Usuarios SET estado = 0, actualizado_el = NOW() WHERE id = %s"
    cursor.execute(query, (id_usuario,))
    db.commit()
    print("Usuario inactivado correctamente.")

def agregar_libro():
    nombre_libro = input("Ingrese nombre del libro: ")
    autor = input("Ingrese autor: ")
    fecha_lanzamiento = input("Ingrese fecha de lanzamiento (YYYY-MM-DD): ")
    id_genero = int(input("Ingrese ID del género: "))
    
    query = "INSERT INTO Libros (nombre_libro, autor, fecha_lanzamiento, id_genero) VALUES (%s, %s, %s, %s)"
    cursor.execute(query, (nombre_libro, autor, fecha_lanzamiento, id_genero))
    db.commit()
    print("Libro agregado correctamente.")

def actualizar_estado_libro():
    id_libro = int(input("Ingrese ID del libro a actualizar: "))
    estado = int(input("Ingrese nuevo estado (1=disponible, 0=no disponible): "))
    
    query = "UPDATE Libros SET estado = %s, actualizado_el = NOW() WHERE id = %s"
    cursor.execute(query, (estado, id_libro))
    db.commit()
    print("Estado del libro actualizado correctamente.")

def inactivar_libro():
    id_libro = int(input("Ingrese ID del libro a inactivar: "))
    
    query = "UPDATE Libros SET estado = 0, actualizado_el = NOW() WHERE id = %s"
    cursor.execute(query, (id_libro,))
    db.commit()
    print("Libro inactivado correctamente.")

def agregar_genero():
    genero = input("Ingrese género: ")
    
    query = "INSERT INTO Generos (genero) VALUES (%s)"
    cursor.execute(query, (genero,))
    db.commit()
    print("Género agregado correctamente.")

def actualizar_genero():
    id_genero = int(input("Ingrese ID del género a actualizar: "))
    nuevo_genero = input("Ingrese nuevo género: ")
    
    query = "UPDATE Generos SET genero = %s WHERE id = %s"
    cursor.execute(query, (nuevo_genero, id_genero))
    db.commit()
    print("Género actualizado correctamente.")

def crear_prestamo():
    usuario_id = int(input("Ingrese ID del usuario: "))
    cursor.execute("SELECT estado FROM usuarios WHERE id = %s", (usuario_id,))
    resultado = cursor.fetchone()
    if resultado[0]== 0:
        input('El usuario esta inactivo, no se puede realizar el prestamo.')
        return
    libro_id = int(input("Ingrese ID del libro: "))
    fecha_devolucion = input("Ingrese fecha de devolución estimada (YYYY-MM-DD): ")
    fecha_devolucion_real = input("Ingrese la fecha de devolución real: ")
    query = "INSERT INTO prestamos (usuario_id, libro_id, fecha_devolucion_estimada, fecha_devolucion_real) VALUES (%s, %s, %s, %s)"
    cursor.execute(query, (usuario_id, libro_id, fecha_devolucion, fecha_devolucion_real,))
    db.commit()
    print("Préstamo creado correctamente.")

def actualizar_fecha_devolucion_prestamo():
    prestamo_id = int(input("Ingrese ID del préstamo a actualizar: "))
    nueva_fecha = input("Ingrese la fecha de devolución estimada (YYYY-MM-DD): ")

    query = "UPDATE prestamos SET fecha_devolucion_estimada = %s WHERE id = %s"
    cursor.execute(query, (nueva_fecha, prestamo_id,))
    db.commit()
    print("Fecha de devolución actualizada correctamente.")

def mostrar_usuarios():
    cursor.execute("SELECT * FROM usuarios ORDER BY id DESC;")
    valor = cursor.fetchall()
    
    headers = ["ID", "Nombre", "Apellido", "DNI", "Teléfono", "Email", "Creado El", "Actualizado El", "Estado"]
    
    print(tabulate(valor, headers=headers, tablefmt="fancy_grid", stralign="center"))
    input("\n¡Se ha mostrado la tabla de usuarios con éxito!")

def mostrar_usuarios_activos():
    cursor.execute("SELECT * FROM usuarios WHERE estado = 1 ORDER BY id DESC;")
    valor = cursor.fetchall()
    
    headers = ["ID", "Nombre", "Apellido", "DNI", "Teléfono", "Email", "Creado El", "Actualizado El", "Estado"]
    
    print(tabulate(valor, headers=headers, tablefmt="fancy_grid", stralign="center"))
    input("\n¡Se ha mostrado la tabla de usuarios activos con éxito!")

def mostrar_libros():
    cursor.execute("SELECT * FROM libros ORDER BY id DESC;")
    valor = cursor.fetchall()
    valor_truncado = [
        (
            row[0],  # ID
            (row[1][:30] + '...') if len(row[1]) > 30 else row[1],  # Nombre de libro
            (row[2][:20] + '...') if len(row[2]) > 20 else row[2],  # Autor
            row[3],  # Fecha de lanzamiento
            row[4],  # Creado El
            row[5],  # Actualizado El
            row[6]   # Estado
        ) for row in valor
    ]

    headers = ["ID", "Nombre de libro", "Autor", "Fecha de lanzamiento", "Creado El", "Actualizado El", "Estado"]

    print(tabulate(valor_truncado, headers=headers, tablefmt="fancy_grid", stralign="center"))
    input("\n¡Se ha mostrado la tabla de libros con éxito!")

def mostrar_libros_disponibles():
    cursor.execute("SELECT * FROM libros WHERE estado = 1 ORDER BY id DESC;")
    valor = cursor.fetchall()
    valor_truncado = [
        (
            row[0],  # ID
            (row[1][:30] + '...') if len(row[1]) > 30 else row[1],  # Nombre de libro
            (row[2][:20] + '...') if len(row[2]) > 20 else row[2],  # Autor
            row[3],  # Fecha de lanzamiento
            row[4],  # Creado El
            row[5],  # Actualizado El
            row[6]   # Estado
        ) for row in valor
    ]

    headers = ["ID", "Nombre de libro", "Autor", "Fecha de lanzamiento", "Creado El", "Actualizado El", "Estado"]

    print(tabulate(valor_truncado, headers=headers, tablefmt="fancy_grid", stralign="center"))
    input("\n¡Se ha mostrado la tabla de libros disponibles con éxito!")

def mostrar_generos():
    cursor.execute("SELECT * FROM generos ORDER BY id DESC;")
    valor = cursor.fetchall()

    headers = ["ID", "Genero"]
    
    print(tabulate(valor, headers=headers, tablefmt="fancy_grid", stralign="center"))
    input("\n¡Se ha mostrado la tabla de generos con éxito!")

def mostrar_prestamos():
    cursor.execute("SELECT * FROM prestamos ORDER BY id DESC;")
    valor = cursor.fetchall()

    headers = ["ID", "Usuario ID", "Libro ID", "Fecha de Prestamo", "Fecha de devolucion estimada", "Fecha de devolucion real"]
    
    print(tabulate(valor, headers=headers, tablefmt="fancy_grid", stralign="center"))
    input("\n¡Se ha mostrado la tabla de generos con éxito!")

def cantidad_libros_prestados():
    query = "SELECT COUNT(*) FROM prestamos WHERE fecha_devolucion_real IS NULL"
    cursor.execute(query)
    total_prestados = cursor.fetchone()[0]
    print(f"Cantidad total de libros prestados actualmente: {total_prestados}")

while True:
    print("Gestor de Biblioteca")
    print("1. Crear Usuario")
    print("2. Actualizar Estado de Usuario")
    print("3. Inactivar Usuario")
    print("4. Agregar Libro")
    print("5. Actualizar Estado de Libro")
    print("6. Inactivar Libro")
    print("7. Agregar Género")
    print("8. Actualizar Género")
    print("9. Crear Préstamo")
    print("10. Actualizar Fecha de Devolución del Préstamo")
    print("11. Mostrar Usuarios")
    print("12. Mostrar Libros")
    print("13. Mostrar Géneros")
    print("14. Mostrar Préstamos")
    print("15. Cantidad de libros Prestados")
    print("16. Mostrar Usuarios Activos")  # Nueva opción
    print("17. Mostrar Libros Disponibles")  # Nueva opción
    print("18. Salir")
    
    option = input("Seleccione una opción: ")
    
    if option == "1":
        crear_usuario()
    elif option == "2":
        actualizar_estado_usuario()
    elif option == "3":
        inactivar_usuario()
    elif option == "4":
        agregar_libro()
    elif option == "5":
        actualizar_estado_libro()
    elif option == "6":
        inactivar_libro()
    elif option == "7":
        agregar_genero()
    elif option == "8":
        actualizar_genero()
    elif option == "9":
        crear_prestamo()
    elif option == "10":
        actualizar_fecha_devolucion_prestamo()
    elif option == "11":
        mostrar_usuarios()
    elif option == "12":
        mostrar_libros()
    elif option == "13":
        mostrar_generos()
    elif option == "14":
        mostrar_prestamos()
    elif option == "15":
        cantidad_libros_prestados()
    elif option == "16":
        mostrar_usuarios_activos()  # Llamada a la nueva opción
    elif option == "17":
        mostrar_libros_disponibles()  # Llamada a la nueva opción
    elif option == "18":
        print("Saliendo...")
        break
    else:
        print("Opción no válida.")