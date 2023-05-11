namespace teste.Entities
{
    public class Pergunta10
  {
        public int Resposta { get; set; }

        public Pergunta10()
        {
            
        }
        

        public void Opcao ()
        {
            fail f;
            switch (Resposta)
            {
                case 0:
                Console.Clear();
                System.Console.WriteLine("You handily defeat the Klingons and are able to beam the survivors of the Kobayashi Moru aboard... only to be beaamed to Apollo's planet to wrship him");
                f = new fail();
                f.Falhou();
                break;

                case 1:
                Console.Clear();

                System.Console.WriteLine("Enemy shields still at 100%");
                f = new fail();
                f.Falhou();
                break;

                case 2: 
                Console.Clear();
                System.Console.WriteLine("A single trible is left behind on your ships suffocate in the sea of adorable tribble offspring");
                f = new fail();
                f.Falhou();
                break;
                    
            }
          
        }

        public void p10 ()
        {
            Console.Clear();
            System.Console.WriteLine("Choose your weapon");
            System.Console.WriteLine("0 - photon torpedos");
            System.Console.WriteLine("1 - pharsers");
            System.Console.WriteLine("2 - Beam tribbles aboard the enemy ship");
            Resposta = int.Parse(Console.ReadLine().ToLower());
            Opcao();
        }
        
    }
}