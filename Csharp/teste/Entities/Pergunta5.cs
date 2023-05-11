namespace teste.Entities
{
    public class Pergunta5
    {
        public int Resposta { get; set; }

        public Pergunta5()
        {
            
        }
        

        public void Opcao ()
        {
            switch (Resposta)
            {
                case 0:
                Pergunta11 p11 = new Pergunta11();
                p11.p11();
                break;

                case 1:
                Pergunta13 p13 = new Pergunta13();
                p13.p13();
                break;

                case 2:
                Console.WriteLine("The Klingons greet Kirk with a troupe of Orion Slave Girls , and he loses track of time");
                fail f = new fail();
                f.Falhou();
                break;

                case 3:
                Pergunta14 p14 = new Pergunta14();
                p14.p14();
                break;
                    
            }
          
        }

        public void p5 ()
        {
            Console.Clear();
            System.Console.WriteLine("Klingons do not listen to petaQ, this is war!What now? ");
            System.Console.WriteLine("0 - Diplomacy falied, attack!");
            System.Console.WriteLine("1 - Beam over Mcoy to negotiate");
            System.Console.WriteLine("2 - Beam over Kirk to negotiate");
            System.Console.WriteLine("3 - Beam over Spock to negotiate");
            Resposta = int.Parse(Console.ReadLine().ToLower());
            Opcao();
        }
        
    }
}