namespace teste.Entities
{
    public class Pergunta1cs
    {
        public char Resposta { get; set; }

        public Pergunta1cs()
        {
            
        }
        public Pergunta1cs(char reposta)
        {
            Resposta = reposta;
        }

        public bool Opcao ()
        {
            if (Resposta == 'y')
                return true;
            else 
                return false;
        }
    }
}