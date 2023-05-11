namespace teste.Entities
{
    public class Pergunta11
  {
        public int Resposta { get; set; }

        public Pergunta11()
        {
            
        } 
        

        public void Opcao ()
        {
            switch (Resposta)
            {
                case 0:
                Pergunta10 p10 = new Pergunta10();
                p10.p10();
                break;

                case 1:
                Pergunta12 p12 = new Pergunta12();
                p12.p12();
                break;
            }
        }
        public void p11 ()
        {
            Console.Clear();
            System.Console.WriteLine("Your shields fail. Now what? ");
            System.Console.WriteLine("0 - Fight on");
            System.Console.WriteLine("1 - Run");
            Resposta = int.Parse(Console.ReadLine().ToLower());
            Opcao();
        }
        
    }
}