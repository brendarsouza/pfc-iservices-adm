package Model;

import java.io.Serializable;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Objects;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.swing.JOptionPane;
import sun.misc.BASE64Encoder;


/**
 *
 * @author brenda
 */

@Entity
public class Usuario implements Serializable {

    @Id@GeneratedValue(strategy = GenerationType.IDENTITY)// SEQUENCE ID
    private int id;
    
    @Column(unique = true)
    private String email;
    private String senha;

    @Enumerated(EnumType.STRING)//vai deixar como varchar no BD - Opções ADMINISTRADOR, PROFISSIONAL OU CLIENTE
    private PerfilAcesso perfilAcesso;  
    
    @Enumerated(EnumType.STRING)//vai deixar como varchar no BD - Opções ATIVO OU INATIVO
    private Status status; 

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

   
    public PerfilAcesso getPerfilAcesso() {
        return perfilAcesso;
    }

    public void setPerfilAcesso(PerfilAcesso perfilAcesso) {
        this.perfilAcesso = perfilAcesso;
    }  

    
    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
    
   public static String encryptBlowfish(String to_encrypt, String strkey) {
        try {
            SecretKeySpec key = new SecretKeySpec(strkey.getBytes(), "Blowfish");
            Cipher cipher = Cipher.getInstance("Blowfish");
            cipher.init(Cipher.ENCRYPT_MODE, key);
            return new String(cipher.doFinal(to_encrypt.getBytes()));
        } catch (Exception e) {
            return null;
        }
    }

}
