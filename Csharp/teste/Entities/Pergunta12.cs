namespace teste.Entities
{
    public class Pergunta12
   {
        public char Resposta { get; set; }
        
        public Pergunta12()
        {
         string texto = "Your ship is talking heavy damage, forcing you to crashland on Ceti Alpha VI. Or wait , is this Ceti Alpha V?";
         Funcl f = new Funcl();
         f.Func(texto);
          p12();
        }
        


        public void p12 ()
        {
            Console.Clear();
            Console.Write("KHAAAAAN!");
                fail f = new fail();
                f.Falhou();
        }
        
    }
}