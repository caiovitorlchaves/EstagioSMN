namespace teste.Entities
{
    public class Pergunta3
    {
        public char Resposta { get; set; }

        public Pergunta3()
        {
            
        }
        

        public void Opcao ()
        {
            if (Resposta == 'y')
            {
                Pergunta4 p4 = new Pergunta4();
                p4.p4();
            }
            else{
                
                Pergunta6 p6 = new Pergunta6();
                p6.p6(); 
            }
                
        }

        public void p3 ()
        {
            Console.Clear();
            Console.Write("Do you enter the Klingon Neutral zone to rescue the ship?");
            Resposta = char.Parse(Console.ReadLine().ToLower());
            Opcao();
        }
        
    }
}