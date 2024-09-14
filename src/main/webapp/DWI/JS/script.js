function showModal() {
    document.getElementById('loginModal').style.display = 'block';
}

function closeModal() {
    document.getElementById('loginModal').style.display = 'none';
}

function showLogin() {
    document.getElementById('loginForm').style.display = 'block';
    document.getElementById('registerForm').style.display = 'none';
    document.getElementById('forgotPasswordForm').style.display = 'none';
}

function showRegister() {
    document.getElementById('loginForm').style.display = 'none';
    document.getElementById('registerForm').style.display = 'block';
    document.getElementById('forgotPasswordForm').style.display = 'none';
}

function showForgotPassword() {
    document.getElementById('loginForm').style.display = 'none';
    document.getElementById('registerForm').style.display = 'none';
    document.getElementById('forgotPasswordForm').style.display = 'block';
}

function login(event) {
    event.preventDefault();
    // Implement login logic
    alert('Iniciar sesión');
}

function register(event) {
    event.preventDefault();
    // Implement registration logic
    alert('Registrarse');
}

function forgotPassword(event) {
    event.preventDefault();
    // Implement forgot password logic
    alert('Olvidé mi contraseña');
    document.getElementById('validationSection').style.display = 'block';
}

function validateCode() {
    // Implement validation logic
    alert('Código validado');
}
function showTable(month) {
    // Guardar el mes seleccionado en localStorage para usar en la redirección
    localStorage.setItem('selectedMonth', month);

    // Ocultar todas las tablas
    document.querySelectorAll('div[id$="-table"]').forEach(function(table) {
        table.style.display = 'none';
    });

    // Mostrar la tabla del mes seleccionado
    document.getElementById(month + '-table').style.display = 'block';

    // Mostrar el botón
    document.getElementById('clientes-btn-container').style.display = 'block';

    // Al hacer clic en el botón, redirige a la página "clientes.html" con el mes como parámetro en la URL
    document.getElementById('clientes-btn').onclick = function() {
        window.location.href = `clientes.html?mes=${month}`; // Se cambió "mes" a "month" para mantener consistencia
    }
}

function redirectClientes() {
    // Obtener el mes seleccionado del localStorage
    const selectedMonth = localStorage.getItem('selectedMonth');
    if (selectedMonth) {
        showTable(selectedMonth); // Mostrar la tabla correspondiente al mes almacenado
    }
}
