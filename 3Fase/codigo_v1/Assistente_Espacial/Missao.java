import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
public class Missao
{
    private String nome;
    private float areatotal;
    private String nomeArea;
    private Plano plano;
    private ArrayList<String> factos;
    private GregorianCalendar datainicio;
    private GregorianCalendar datafim;
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
        this.datainicio = new GregorianCalendar();
        this.datafim = new GregorianCalendar();
    
    }
    
    /**
     * Construtor parametrico
     */
     public Missao(String nome, float area, String nomeArea, Plano plano, GregorianCalendar d1, GregorianCalendar d2){
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
    
    public GregorianCalendar getDataI(){
        return this.datainicio;
    }
    
    public GregorianCalendar getDataF(){
        return this.datafim;
    }
    
    //Clone, equals, toString
    
    public Missao clone(){
        return new Missao(this);
    }
    
    public boolean equals(Missao m){
        if(this==m) return true;
        if(( m==null ) || (m.getClass() != this.getClass()) ) return false;
        
        Missao aux = (Missao) m;
        boolean comp = (this.areatotal == m.getArea());
        comp = comp && (this.nome.equals(m.getNome()));
        comp = comp && (this.datainicio.equals(m.getDataI()));
        comp = comp && (this.datafim.equals(m.getDataF()));
        //comp = comp && ( this.plano.equals(m.getPlano()) );
        
        return comp;
    
    }
    
    public String toString(){
        StringBuilder sb = new StringBuilder();
        String areatotal_;
        String day1, month1, year1, day2, month2, year2;
        
        day1 = String.valueOf(datainicio.get(GregorianCalendar.DAY_OF_MONTH));
        month1 = String.valueOf(datainicio.get(GregorianCalendar.MONTH));
        year1 = String.valueOf(datainicio.get(GregorianCalendar.YEAR));
       
          day2 = String.valueOf(datafim.get(GregorianCalendar.DAY_OF_MONTH));
        month2 = String.valueOf(datafim.get(GregorianCalendar.MONTH));
        year2 = String.valueOf(datafim.get(GregorianCalendar.YEAR));
       
        sb.append("Missao " + nome + ";");
        sb.append("Data Inicio: " + day1 + "/" + month1 + "/" + year1 +"\n");
        sb.append("Data Fim: " + day1 + "/" + month1 + "/" + year1 +"\n");
        return sb.toString();
        
        /*
         *  private String nome;
    private float areatotal;
    private String nomeArea;
    private Plano plano;
    private ArrayList<String> factos;
    private Date datainicio;
    private Date datafim;
         */
    }
    
    
}
