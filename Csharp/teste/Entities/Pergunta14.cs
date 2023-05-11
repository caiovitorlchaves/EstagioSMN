namespace teste.Entities
{
    public class Pergunta14
  {
        public char Resposta { get; set; }
        
        public Pergunta14()
        {
         string texto = "A sudden ion storn cause a transporter malfunction, sending Evil Spock to negotiate instead";
         Funcl f = new Funcl();
         f.Func(texto);
          p14();
        }


        public void p14 ()
        {
            Console.Clear();
                System.Console.WriteLine("Led by Evil Spock , the Klingons launch a planet killer at you (Evil Spock logically chose the winning team)");
                fail f = new fail();
                f.Falhou();
        }
        
    }
}