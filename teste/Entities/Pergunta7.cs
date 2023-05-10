namespace teste.Entities
{
    public class Pergunta7
    {
        public char Resposta { get; set; }
        
        public Pergunta7()
        {
         string texto = "After a long pursuit into an uncharted solar system, you and the klingons are captured by Metrons and they force both ships";
         Funcl f = new Funcl();
         f.Func(texto);
          p7();
        }
         

        public void Opcao ()
        {
            if (Resposta == 'y')
            {
                System.Console.WriteLine("You enemy exploits your moment of weakness");
                fail f = new fail();
                f.Falhou();
            }
            else{
                System.Console.WriteLine("The Metrons think you are savage and kill you");
                fail f = new fail();
                f.Falhou();
            }
                
        }

        public void p7 ()
        {
            Console.Clear();
            Console.Write("Do you have a bizarre desire to sword fight everyone on the ship?");
            Resposta = char.Parse(Console.ReadLine().ToLower());
            Opcao();
        }
        
    }
}