namespace teste.Entities
{
    public class Pergunta2
    {
        public char Resposta { get; set; }

        public Pergunta2()
        {
            
        }
        

        public void Opcao ()
        {
            if (Resposta == 'n')
            {
                Pergunta3 p3 = new Pergunta3();
                p3.p3();
            }
            else{
                System.Console.WriteLine("Your crew turns mutinuos due to your disgusting lack of morals");
                fail f = new fail();
                f.Falhou();
            }
                
        }

        public void p2 ()
        {
            Console.Clear();
            Console.Write("Do you ignore the distress call?");
            Resposta = char.Parse(Console.ReadLine().ToLower());
            Opcao();
        }
        
    }
}