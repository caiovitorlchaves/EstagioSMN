namespace teste.Entities
{
    public class Pergunta9
   {
        public char Resposta { get; set; }

        public Pergunta9()
        {
            
        }
        


        public void p9 ()
        {
            Console.Clear();
            Console.WriteLine("Are you emotionally compromised?");
            System.Console.WriteLine("I don't want to talk about  my feelings");
                fail f = new fail();
                f.Falhou();
        }
        
    }
}