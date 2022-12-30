<%@page import="modelo.SociosDAO"%>
<%@page import="modelo.Socios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Modificar socio.</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            <div class="container">
                <h1 class="text-center">Modificar socio</h1>

                <%
                String id = request.getParameter("id");
                int mid = Integer.parseInt(id);

                Socios resultado = null;
                SociosDAO socio = new SociosDAO();

                resultado = socio.mostrarSocio(mid);

                %>
                
                <div class="row">
                    <form class="p-5" method="POST" action="SociosController?accion=actualizar">
                        <div class="mb-2">
                            <label for="id_socio" class="form-label">Id</label>
                            <input type="text" class="form-control" id="id" name="id_socio" readonly="true" value=<%=resultado.getId()%>>
                        </div>
                        <div class="mb-2">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" value=<%=resultado.getNombre()%>>
                        </div>
                        <div class="mb-2">
                            <label for="apellido" class="form-label">Apellido</label>
                            <input type="text" class="form-control" id="apellido" name="apellido" value=<%=resultado.getApellido()%>>
                        </div>
                        <div class="mb-2">
                            <label for="direccion" class="form-label">Direccion</label>
                            <input type="text" class="form-control" id="direccion" name="direccion" value=<%=resultado.getDireccion()%>>
                        </div>                        
                        <div class="mb-2">
                            <label for="localidad" class="form-label">Localidad</label>
                            <input type="text" class="form-control" id="localidad" name="localidad" value=<%=resultado.getLocalidad()%>>
                        </div>
                        <div class="mb-2">
                            <label for="fechaNac" class="form-label">Fecha Nacimiento</label>
                            <input type="date" class="form-control" id="fechaNac" name="fecha_nacimiento" value=<%=resultado.getFnac()%>>
                        </div>                                                        
                        <div class="mb-2">
                            <label for="mail" class="form-label">Correo Electrónico</label>
                            <input type="email" class="form-control" id="mail" name="email" value=<%=resultado.getMail()%>>
                        </div>
                        <div class="mb-2">
                            <label for="telefono" class="form-label">Telefono</label>
                            <input type="tel" class="form-control" id="telefono" name="telefono" value=<%=resultado.getTelefono()%>>
                        </div>    
                        <!--                  
                        <div class="mb-2">
                            <label for="activo" class="form-label">Activo</label>
                            <input type="radio" class="form-control" id="activo" name="activo">
                        </div>
                        -->

                        <button type="submit" class="btn btn-success" id="register">Aceptar modificación</button>
                        <input type="button" class="btn btn-info" onclick="history.back();" value="Volver">
                        
                    </form>

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

