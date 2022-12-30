// Defino valor del ticket
const valorTicket = 200;

// Defino porcentajes de descuento según categoría
let descuentoEstudiante = 80;
let descuentoTrainee = 50;
let descuentoJunior = 15;

// Elementos en variables
let nombre = document.getElementById("nombre");
let apellido = document.getElementById("apellido");
let mail = document.getElementById("mail");
let cantTickets = document.getElementById("cantTickets");
let categoria = document.getElementById("categoriaSelect");

function totalPagar()
{
    quitarClaseError();

    if(nombre.value === "")
    {
        alert("Se debe escribir el nombre..");
        nombre.classList.add("is-invalid");
        nombre.focus();
        return;
    }

    if(apellido.value === "")
    {
        alert("Se debe escribir el apellido..");
        apellido.classList.add("is-invalid");
        apellido.focus();
        return;
    }

    if(mail.value === "")
    {
        alert("Se debe escribir el correo electrónico..");
        mail.classList.add("is-invalid");
        mail.focus();
        return;
    }

    // Para determinar si el correo es válido o no
    const emailValido = mail =>
    {
        return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(mail);
    }

    if(!emailValido(mail.value))
    {
        alert("Escribir bien el mail..");
        mail.classList.add("is-invalid");
        mail.focus();
        return;
    }

    if(cantTickets.value <= 0 || isNaN(cantTickets.value))
    {
        alert("Revisar cantidad de tickets..");
        cantTickets.classList.add("is-invalid");
        cantTickets.focus();
        return;
    }
    
    if(categoria.value === "")
    {
        alert("Escribir categoria..");
        categoria.classList.add("is-invalid");
        categoria.focus();
        return;
    }

    // multiplico total * entradas
    let totalValorTickets = cantTickets.value * valorTicket;

    if(categoria.value == 0)
    {
        totalValorTickets = totalValorTickets;
    }
    if(categoria.value == 1)
    {
        totalValorTickets = totalValorTickets - (descuentoEstudiante / 100 * totalValorTickets);
    }
    if(categoria.value == 2)
    {
        totalValorTickets = totalValorTickets - (descuentoJunior / 100 * totalValorTickets);
    }
    if(categoria.value == 3)
    {
        totalValorTickets = totalValorTickets - (descuentoTrainee / 100 * totalValorTickets);
    }
    if(categoria.value == 4)
    {
        totalValorTickets = totalValorTickets;
    }

    totalPago.innerHTML = totalValorTickets;
}

function quitarClaseError()
{
    let x = document.querySelectorAll(".form-control, .form-select");
    let i;

    for(i = 0; i < x.length ; i++)
    {
        x[i].classList.remove("is-invalid");
    }
}

// Desarrollo funcion
function resetPagar()
{
    quitarClaseError();
    totalPago.innerHTML = "";
}

// Boton resumen
btnResumen.addEventListener("click", totalPagar);
// Boton borrar
btnBorrar.addEventListener("click", resetPagar)