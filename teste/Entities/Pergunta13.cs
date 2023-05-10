namespace teste.Entities
{
    public class Pergunta13
   {
        public int Resposta { get; set; }
        
        public Pergunta13()
        {
            string texto = "I'm a doctor,not a __________!";
         Funcl f = new Funcl();
         f.Func(texto);
          p13();
        }
    public void Opcao ()
        {
            fail f;
            switch (Resposta)
            {
                case 0:
                System.Console.WriteLine("Klingons are an agressive species. You Would have needed a miracle");
                f = new fail();
                f.Falhou();
                break;

                case 1:
                System.Console.WriteLine("The Klingons had  ulterior motives, whinch Bones falied to deduce");
                f = new fail();
                f.Falhou();
                break;

                case 2: 
                System.Console.WriteLine("McCoy was probaly the worst choice for a diplomatic mission ");
                f = new fail();
                f.Falhou();
                break;
                    
            }
          
        }

        public void p13 ()
        {
            Console.Clear();
            System.Console.WriteLine("I'm a doctor,not a __________!");
            System.Console.WriteLine("0 - Miracle worker");
            System.Console.WriteLine("1 - Minder reader");
            System.Console.WriteLine("2 - Diplomat");
            Resposta = int.Parse(Console.ReadLine());
            Opcao();
        }
        
    }
}