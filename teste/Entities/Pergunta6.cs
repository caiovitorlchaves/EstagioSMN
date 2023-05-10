namespace teste.Entities
{
    public class Pergunta6
   {
        public char Resposta { get; set; }

        public Pergunta6()
        {
            
        }
        

        public void Opcao ()
        {
            if (Resposta == 'n')
            {
                Pergunta8 p8 = new Pergunta8();
                p8.p8();
            }
            else{
                System.Console.WriteLine("The shuttle is absorved by a giant amoeab");
                fail f = new fail();
                f.Falhou();
            }
                
        }

        public void p6 ()
        {
            Console.Clear();
            Console.Write("Do you send a unarmed shuttle across the Neutral Zone to save the stranded ship?");
            Resposta = char.Parse(Console.ReadLine().ToLower());
            Opcao();
        }
        
    }
}