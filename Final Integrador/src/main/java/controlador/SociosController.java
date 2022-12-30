/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Socios;
import modelo.SociosDAO;

public class SociosController extends HttpServlet
{
    public SociosController()
    {
        super();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        SociosDAO sociosDAO = null;
        try
        {
            sociosDAO = new SociosDAO();
        }
        catch (SQLException ex)
        {
            System.out.println("Error: " + ex);
        }
        
        String accion;
        RequestDispatcher dispatcher = null;
        accion = request.getParameter("accion");
        
        if(accion == null || accion.isEmpty())
        {
            dispatcher = request.getRequestDispatcher("Vistas/socios.jsp");
        }
        else if(accion.equals("modificar"))
        {
            dispatcher = request.getRequestDispatcher("Vistas/modificarSocios.jsp");
        }
        else if(accion.equals("actualizar"))
        {
           int id = Integer.parseInt(request.getParameter("id_socio"));
           String nombre = request.getParameter("nombre");
           String apellido = request.getParameter("apellido");
           String direccion = request.getParameter("direccion");
           String localidad = request.getParameter("localidad");
           LocalDate fechaNac = LocalDate.parse(request.getParameter("fecha_nacimiento"));
           String mail = request.getParameter("email");
           String telefono = request.getParameter("telefono");
           
           Socios socio = new Socios(id, nombre, apellido, direccion, localidad, fechaNac, mail, telefono, true);
           //if(socio != null)
           sociosDAO.actualizarSocios(socio);
           
           dispatcher = request.getRequestDispatcher("Vistas/socios.jsp");
        }
        else if(accion.equals("eliminar"))
        {
            int id = Integer.parseInt(request.getParameter("id"));
            sociosDAO.eliminarSocio(id);
            dispatcher = request.getRequestDispatcher("Vistas/socios.jsp");
        }
        else if(accion.equals("nuevo"))
        {
            dispatcher = request.getRequestDispatcher("Vistas/nuevoSocio.jsp");
        }
        else if(accion.equals("insert"))
        {
           String nombre = request.getParameter("nombre");
           String apellido = request.getParameter("apellido");
           String direccion = request.getParameter("direccion");
           String localidad = request.getParameter("localidad");
           LocalDate fechaNac = LocalDate.parse(request.getParameter("fecha_nacimiento"));
           String mail = request.getParameter("email");
           String telefono = request.getParameter("telefono");
           
           Socios socio = new Socios(0, nombre, apellido, direccion, localidad, fechaNac, mail, telefono, true);
           sociosDAO.insertSocio(socio);
           dispatcher = request.getRequestDispatcher("Vistas/socios.jsp");
        }
        
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGet(request,response);
    }

    @Override
    public String getServletInfo()
    {
        return "Short description";
    }// </editor-fold>

}
