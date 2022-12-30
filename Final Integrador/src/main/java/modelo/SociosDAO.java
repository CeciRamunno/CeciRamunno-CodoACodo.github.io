/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SociosDAO
{
    Connection conex;
    
    public SociosDAO() //throws SQLException
    {
        Conexion cnx = new Conexion();
        try {
            conex = cnx.getConnection();
        } catch (SQLException ex) {
            Logger.getLogger(SociosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<Socios> listarSocios()
    {
        PreparedStatement ps;
        ResultSet rs;
        List<Socios> listaSocios = new ArrayList<>();
               
        try
        {
            ps = conex.prepareStatement("select * from socios");
            rs = ps.executeQuery();
            
            while(rs.next())
            {
                int id = rs.getInt("idSocio");
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String direccion = rs.getString("direccion");
                String localidad = rs.getString("localidad");
                LocalDate fnac = rs.getDate("fnac").toLocalDate();
                String mail = rs.getString("mail");
                String telefono = rs.getString("telefono");
                boolean activo = rs.getBoolean("activo");
                
                Socios nuevoSocio = new Socios(id, nombre, apellido, direccion, localidad, fnac, mail, telefono, activo);
                listaSocios.add(nuevoSocio);
            }
        }
        catch(SQLException e)
        {
            System.out.println("Error: " + e);
            return null;
        }
        return listaSocios;
    }
    
    public Socios mostrarSocio(int id)
    {
        PreparedStatement ps;
        ResultSet rs;
        Socios socio = null;
        
        try
        {
            ps = conex.prepareStatement("select * from socios where idSocio = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            
            while(rs.next())
            {
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String direccion = rs.getString("direccion");
                String localidad = rs.getString("localidad");
                LocalDate fnac = rs.getDate("fnac").toLocalDate();
                String mail = rs.getString("mail");
                String telefono = rs.getString("telefono");
                boolean activo = rs.getBoolean("activo");

                socio = new Socios(id, nombre, apellido, direccion, localidad, fnac, mail, telefono, activo);
            }
            return socio;            
        }
        catch(SQLException e)
        {
            System.out.println("Error: " + e);
            return null;
        }
    }
    
    public boolean insertSocio(Socios socio)
    {
        PreparedStatement ps;
               
        try
        {
            ps = conex.prepareStatement("insert into socios (nombre, apellido, direccion, localidad, fnac, mail, telefono, activo) values (?,?,?,?,?,?,?,?)");
            ps.setString(1, socio.getNombre());
            ps.setString(2, socio.getApellido());
            ps.setString(3, socio.getDireccion());
            ps.setString(4, socio.getLocalidad());
            ps.setObject(5, socio.getFnac());
            ps.setString(6, socio.getMail());
            ps.setString(7, socio.getTelefono());
            ps.setBoolean(8, socio.isActivo());
            ps.execute();
            
            return true;
        }
        catch(SQLException e)
        {
            System.out.println("Error: " + e);
            return false;
        }
    }
    
    public boolean eliminarSocio(int id)
    {
         PreparedStatement ps;
         
         try
        {
            ps = conex.prepareStatement("delete from socios where id = ?");
            ps.setInt(1, id);
            ps.execute();
            
            return true;
        }
        catch(SQLException e)
        {
            System.out.println("Error: " + e);
            return false;
        }
    }
    
    public boolean actualizarSocios(Socios socio)
    {
        PreparedStatement ps;
               
        try
        {
            ps = conex.prepareStatement("update socios set nombre=?, apellido=?, direccion=?, localidad=?, fnac=?, mail=?, telefono=?, activo=? where idSocio=?");
            ps.setString(1, socio.getNombre());
            ps.setString(2, socio.getApellido());
            ps.setString(3, socio.getDireccion());
            ps.setString(4, socio.getLocalidad());
            ps.setObject(5, socio.getFnac());
            ps.setString(6, socio.getMail());
            ps.setString(7, socio.getTelefono());
            ps.setBoolean(8, socio.isActivo());
            ps.execute();
            
            return true;
        }
        catch(SQLException e)
        {
            System.out.println("Error: " + e);
            return false;
        }
    }
}
