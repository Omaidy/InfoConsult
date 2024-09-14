import mysql.connector
from mysql.connector import Error

def get_month_name(month_number):
    """Devuelve el nombre completo del mes en español para un número de mes."""
    month_names = [
        'enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio',
        'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre'
    ]
    return month_names[month_number - 1]

def create_tables_in_range(start_date, end_date):
    try:
        # Conectar a la base de datos
        connection = mysql.connector.connect(
            host='localhost',  # Cambia esto si es necesario
            user='root',  # Cambia esto por tu usuario
            password='',  # Cambia esto por tu contraseña
            database='dwi'  # Cambia esto por tu base de datos
        )

        if connection.is_connected():
            cursor = connection.cursor()

            # Crear tablas para el rango de fechas
            start_year, start_month = map(int, start_date.split('-'))
            end_year, end_month = map(int, end_date.split('-'))

            for year in range(start_year, end_year + 1):
                for month in range(1, 13):
                    if year == start_year and month < start_month:
                        continue
                    if year == end_year and month > end_month:
                        break

                    month_name = get_month_name(month)
                    table_name = f'personas_{month_name}_{year}'

                    create_table_query = f'''
                    CREATE TABLE {table_name} (
                        id INT(11) AUTO_INCREMENT PRIMARY KEY,
                        tipoDocumento VARCHAR(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
                        digitoVerificador VARCHAR(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
                        dni VARCHAR(20) COLLATE utf8mb4_general_ci NOT NULL,
                        nombres VARCHAR(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
                        apellidoPaterno VARCHAR(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
                        apellidoMaterno VARCHAR(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
                        INDEX (dni)
                    );
                    '''

                    cursor.execute(create_table_query)
                    print(f"Tabla {table_name} creada exitosamente.")

            connection.commit()

    except Error as e:
        print(f"Error al conectar a la base de datos: {e}")

    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("Conexión a la base de datos cerrada.")

# Rango de fechas para crear
create_tables_in_range('2024-02', '2024-09')
