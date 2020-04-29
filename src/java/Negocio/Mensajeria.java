/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Negocio;

import Dao.Conexion;
import Dao.MensajeJpaController;
import Dao.exceptions.NonexistentEntityException;
import Dto.Mensaje;
import Dto.Usuario;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author USUARIO
 */
public class Mensajeria {

    Conexion con;

    public Mensajeria() {
        con = Conexion.getConexion();
    }

    public List<Mensaje> getMensajes() {
        MensajeJpaController mjc = new MensajeJpaController(con.getBd());
        List<Mensaje> lmen = mjc.findMensajeEntities();
        if (lmen != null) {
            return lmen;
        }
        return null;
    }

    public Mensaje getMensajeById(int id) {
        MensajeJpaController mjc = new MensajeJpaController(con.getBd());
        return mjc.findMensaje(id);
    }

    public void update(Mensaje m) {
        MensajeJpaController mjc = new MensajeJpaController(con.getBd());
        try {
            mjc.edit(m);
        } catch (Exception ex) {
            Logger.getLogger(Mensajeria.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void removMensaje(int id) {
        MensajeJpaController mjc = new MensajeJpaController(con.getBd());
        try {
            mjc.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(Mensajeria.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
//    public List<Usuario> getUsuario(){
//        
//    }

}
