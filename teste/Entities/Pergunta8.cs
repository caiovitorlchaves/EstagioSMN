namespace teste.Entities
{
    public class Pergunta8
    {
        public char Resposta { get; set; }

        public Pergunta8()
        {
            
        }
        

        public void Opcao ()
        {
            if (Resposta == 'n')
            {
                Pergunta9 p9 = new Pergunta9();
                p9.p9();
            }
            else{
                System.Console.WriteLine("Looks like you drank the water on Psi 2000-your tipsy crew");
                fail f = new fail();
                f.Falhou();
            }
                
        }

        public void p8 ()
        {
            Console.Clear();
            Console.Write("Do you have a bizarre desire to sword fight everyone on the ship?");
            Resposta = char.Parse(Console.ReadLine().ToLower());
            Opcao();
        }
        
    }
}