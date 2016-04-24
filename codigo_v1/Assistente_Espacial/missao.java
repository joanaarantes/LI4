import java.util.ArrayList;
import java.util.Date;

public class missao
{
    private String nome;
    private float areatotal;
    private String nomeArea;
    private String nomePlano;
    private ArrayList<String> factos;
    private Date datainicio;
    private Date datafim;
    //TODO check date
    //TODO ver se temos factos no diagrama de dominio
    
    /**
     * Construtor vazio de missao
     */
    public missao(){
        this.nome = "Nome default";
        this.areatotal = 0;
        this.nomeArea =" ";
        this.nomePlano= " ";
        this.factos = null;
        this.datainicio = new Date();
        this.datafim = new Date();
    
    }
    
    /**
     * Construtor parametrico
     */
     public missao(String nome, float area, String nomeArea, String nomePlano, Date d1, Date d2){
        this.nome = nome;
        this.areatotal = area;
        this.nomeArea = nomeArea;
        this.nomePlano= nomePlano;
        this.factos = null;
        this.datainicio = d1;
        this.datafim = d2;
    
    }
    
    /**
     * Construtor de cópia
     */
    public missao(missao missaocopy){
        this.nome = missaocopy.getNome();
        this.areatotal = missaocopy.getArea();
        this.nomeArea = missaocopy.getNomeArea();
        this.nomePlano= missaocopy.getNomePlano();
        this.factos = null;
        this.datainicio = missaocopy.getDataI();
        this.datafim = missaocopy.getDataF();
    }
    
    /**
     * Getters and Setters
     */
    //TODO setters e o resto, tratar o arraylist
    
    public String getNome(){
        return this.nome;
    }
    
    public float getArea(){
        return this.areatotal;
    }
    
    public String getNomeArea(){
        return this.nomeArea;
    }
    
    public String getNomePlano(){
        return this.nomePlano;
    }
    
    public Date getDataI(){
        return this.datainicio;
    }
    
    public Date getDataF(){
        return this.datafim;
    }
    
    
}
