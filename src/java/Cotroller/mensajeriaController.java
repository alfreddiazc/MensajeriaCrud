/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Cotroller;

import Dto.Mensaje;
import Negocio.Mensajeria;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author USUARIO
 */
public class mensajeriaController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action=request.getParameter("action");
        System.out.println("action : "+ action);
        Mensajeria msj= new Mensajeria();
        switch(action){
            case "mostrar": 
                request.setAttribute("list",msj.getMensajes());
                request.getRequestDispatcher("mensajes.jsp").forward(request, response);
                break;
            case "showEditar":
                request.setAttribute("mensaje",msj.getMensajeById(Integer.parseInt(request.getParameter("id"))));
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "editar":
                String id=request.getParameter("id");
                String nombre=request.getParameter("nombre");
                String email=request.getParameter("email");
                String sitioweb=request.getParameter("sitioweb");
                String mensaje=request.getParameter("mensaje");
                Mensaje m=new Mensaje(Integer.parseInt(id), nombre, email, sitioweb, mensaje);
                String user=request.getParameter("usuarios");
                System.out.println("user: "+user);
                m.setUsuario(msj.buUsuario(user));
                msj.update(m);
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            case "eliminar":
                msj.removMensaje(Integer.parseInt(request.getParameter("id")));
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            case "registrar":
                String n=request.getParameter("nombre");
                String e=request.getParameter("email");
                String s=request.getParameter("sitioweb");
                String mens=request.getParameter("mensaje");
                Mensaje newm=new Mensaje();
                String usuario=request.getParameter("usuarios");
                newm.setNombre(n);
                newm.setEmail(e);
                newm.setSitioweb(s);
                newm.setMensaje(mens);
                newm.setUsuario(msj.buUsuario(usuario));
                if( msj.registrar(newm)){
                    request.setAttribute("list", msj.getMensajes());
                    request.getRequestDispatcher("mensajes.jsp").forward(request, response);
                }else{
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                
                
                
                
        }
        
        
        
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
