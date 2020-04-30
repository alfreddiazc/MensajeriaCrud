/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Negocio;

import Dao.Conexion;
import Dao.MensajeJpaController;
import Dao.UsuarioJpaController;
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

    public boolean registrar(Mensaje m) {

        MensajeJpaController mjc = new MensajeJpaController(con.getBd());
        for (Mensaje me : this.getMensajes()) {
            if (me.getNombre().equals(m.getNombre()) && me.getEmail().equals(m.getEmail()) && me.getMensaje().equals(m.getMensaje())) {
                return false;
            }
        }
        mjc.create(m);
        return true;
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

    public List<Usuario> getUsuario() {
        UsuarioJpaController ujc = new UsuarioJpaController(con.getBd());
        List<Usuario> lu = ujc.findUsuarioEntities();
        return lu;
    }

    public Usuario buUsuario(String u) {
        List<Usuario> lu = this.getUsuario();
        for (Usuario usuario : lu) {
            if (usuario.getUsuario().equals(u)) {
                return usuario;
            }
        }
        return null;
    }

}
