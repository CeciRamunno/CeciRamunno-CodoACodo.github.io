<%@page import="modelo.SociosDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Socios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Socios</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Vistas/css/socios.css">
        <script src="https://kit.fontawesome.com/2cbbc87d30.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    </head>
    <body>
        <header>
            <nav class="navbar bg-body-tertiary">
                <div class="container-fluid">
                  <span class="navbar-brand mb-0 h1">Proyecto Gimnasio 🏋️‍</span>
                </div>
            </nav>
        </header>
        
        <main>
            <h1 class="text-center">Listado de socios del Gimnasio</h1>

            <div class="container">
                <div class="d-flex justify-content-end">
                    <a class="btn btn-primary" href="SociosController?accion=nuevo"><i class="fa-solid fa-user-plus"></i></a>
                </div>
                <div class="row">
                    
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Dirección</th>
                                <th>Localidad</th>
                                <th>Fecha Nacimiento</th>
                                <th>Mail</th>
                                <th>Telefono</th>
                                <th>Activo</th>
                                <th>Modificar</th>
                                <th>Eliminar</th>
                            </tr>
                        </thead>

                        <%
                        List<Socios> resultado = null;
                        SociosDAO socios = new SociosDAO();
                        resultado = socios.listarSocios();

                        for(int x = 0; x < resultado.size(); x++)
                        {
                            String rutaModificar = "SociosController?accion=modificar&id=" + resultado.get(x).getId();
                            String rutaEliminar = "SociosController?accion=eliminar&id=" + resultado.get(x).getId();
                        %>

                        <tr>
                            <td><%=resultado.get(x).getId()%></td>
                            <td><%=resultado.get(x).getNombre()%></td>
                            <td><%=resultado.get(x).getApellido()%></td>
                            <td><%=resultado.get(x).getDireccion()%></td>
                            <td><%=resultado.get(x).getLocalidad()%></td>
                            <td><%=resultado.get(x).getFnac()%></td>
                            <td><%=resultado.get(x).getMail()%></td>
                            <td><%=resultado.get(x).getTelefono()%></td>
                            <td><%=resultado.get(x).isActivo()%></td>
                            <td class="text-center"><a href=<%=rutaModificar%>><i class="fa-solid fa-user-pen"></i></a></td>
                            <td class="text-center"><a href=<%=rutaEliminar%>><i class="fa-solid fa-user-xmark"></i></a></td>
                        </tr>
                        
                        
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>   
        </main>
        <footer>
            <nav class="navbar bg-body-tertiary">
                <div class="container-fluid justify-content-center align-items-end">
                    <span class="navbar-text">
                        Trabajo Integrador JAVA Full Stack 2022 - Maria Cecilia Ramunno <a href="https://www.linkedin.com/in/maceciliaramunno/"><i class="fa-brands fa-linkedin"></i></a> <a href="https://github.com/CeciRamunno/CeciRamunno-CodoACodo.github.io"><i class="fa-brands fa-github"></i></a>
                    </span>
                </div>
            </nav>     
        </footer>
    </body>
</html>
