namespace teste.Entities
{
    public class Pergunta4
    {
        public int Resposta { get; set; }

        public Pergunta4()
        {
            
        }
        

        public void Opcao ()
        {
            switch (Resposta)
            {
                case 0:
                Pergunta5 p5 = new Pergunta5();
                p5.p5();
                break;

                case 1:
                Pergunta7 p7 = new Pergunta7();
                p7.p7();
                break;

                case 2: 
                Pergunta10 p10 = new Pergunta10();
                p10.p10();
                break;
                    
            }
          
        }

        public void p4 ()
        {
            Console.Clear();
            Console.Write("Red Alert");
            System.Console.WriteLine("");
            System.Console.WriteLine("A Klingom ship emerges from deep space. What do you do? ");
            System.Console.WriteLine("0 - Try Diplomacy");
            System.Console.WriteLine("1 - Retreat");
            System.Console.WriteLine("2 - Preemptive Strike");
            Resposta = int.Parse(Console.ReadLine().ToLower());
            Opcao();
        }
        
    }
}