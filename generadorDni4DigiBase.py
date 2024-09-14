
def generar_dni(base_dni, cantidad):
    """
    Genera una lista de números de DNI cambiando los últimos cuatro dígitos
    del DNI base.

    Args:
        base_dni (int): El número base del DNI (8 dígitos).
        cantidad (int): La cantidad de DNIs a generar.

    Returns:
        list: Lista con los DNIs generados.
    """
    dni_base_str = str(base_dni)

    # Verifica que el DNI base tenga 8 dígitos
    if len(dni_base_str) != 8:
        raise ValueError("El DNI base debe tener exactamente 8 dígitos.")

    # Extrae los primeros 4 dígitos (parte fija del DNI)
    primeros_digitos = dni_base_str[:4]

    # Generar una lista de DNIs cambiando los últimos 4 dígitos
    dni_generados = []
    for i in range(cantidad):
        # Rellenar con ceros a la izquierda si el número es menor a 4 dígitos
        ultimos_digitos = str(i).zfill(4)
        nuevo_dni = primeros_digitos + ultimos_digitos
        dni_generados.append(nuevo_dni)

    return dni_generados


# Ejemplo de uso
base_dni = 40474589
cantidad_dnis = 10

dnis = generar_dni(base_dni, cantidad_dnis)

# Mostrar los DNIs generados
for dni in dnis:
    print(dni)
