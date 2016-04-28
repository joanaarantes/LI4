
/**
 * Escreva a descrição da classe Plano aqui.
 * 
 * @author (seu nome) 
 * @version (número de versão ou data)
 */
public class Plano
{
    private String nome;

    /**
     * Construtor para objetos da classe Plano
     */
    public Plano()
    {
        this.nome = "";
        
    }
    
    public Plano(Plano a){
        a.nome = this.nome;
    }

    
   public String getNome(){
       return this.nome;
    }
    
   
    public Plano clone(){
        return new Plano(this);
    }
}
