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
        <div class="container">
            <h1 class="text-center">Nuevo socio</h1>
            <div class="row">
                
                <%
                String id = request.getParameter("id");
                int mid;
                mid = Integer.parseInt(id);
                
                Socios resultado = null;
                SociosDAO socio = new SociosDAO();
                   
                resultado = socio.mostrarSocio(mid);

                %>
                
                <form class="p-5" method="POST" action="SociosController?accion=insert">
                    <div class="mb-2">
                        <label for="id" class="form-label">Id</label>
                        <input type="text" class="form-control" id="id" name="id" readonly="true" value=<%=resultado.getId()%>>
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
                        <input type="date" class="form-control" id="fechaNac" name="fechaNac" value=<%=resultado.getFnac()%>>
                    </div>                                                        
                    <div class="mb-2">
                        <label for="mail" class="form-label">Correo Electrónico</label>
                        <input type="email" class="form-control" id="mail" name="mail" value=<%=resultado.getMail()%>>
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

                    <button type="submit" class="btn btn-primary">Modificar socio</button>
                    <!--todo    agregar reset campos -->
                </form>
                
            </div>
        </div>
    </body>
</html>

