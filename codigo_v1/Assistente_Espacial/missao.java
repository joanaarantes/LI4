import java.util.ArrayList;
import java.util.Date;

public class Missao
{
    private String nome;
    private float areatotal;
    private String nomeArea;
    private Plano plano;
    private ArrayList<String> factos;
    private Date datainicio;
    private Date datafim;
    //TODO check date
    //TODO ver se temos factos no diagrama de dominio
    
    /**
     * Construtor vazio de missao
     */
    public Missao(){
        this.nome = "Nome default";
        this.areatotal = 0;
        this.nomeArea =" ";
        this.plano= null;
        this.factos = null;
        this.datainicio = new Date();
        this.datafim = new Date();
    
    }
    
    /**
     * Construtor parametrico
     */
     public Missao(String nome, float area, String nomeArea, Plano plano, Date d1, Date d2){
        this.nome = nome;
        this.areatotal = area;
        this.nomeArea = nomeArea;
        this.plano= plano.clone();
        this.factos = null;
        this.datainicio = d1;
        this.datafim = d2;
    
    }
    
    /**
     * Construtor de cópia
     */
    public Missao(Missao missaocopy){
        this.nome = missaocopy.getNome();
        this.areatotal = missaocopy.getArea();
        this.nomeArea = missaocopy.getNomeArea();
        this.plano= missaocopy.plano.clone();
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
    
    public Plano getNomePlano(){
        return this.plano.clone();
    }
    
    public Date getDataI(){
        return this.datainicio;
    }
    
    public Date getDataF(){
        return this.datafim;
    }
    
    
}
