using System;
using teste.Entities;


namespace teste // Note: actual namespace depends on the project name.
{
     class Program
    {
        static void Main(string[] args)
        {
            fail f = new fail();
            Console.Clear();
            Console.Write("Are you a cheater (y/n)? ");

            Pergunta1cs p1 = new Pergunta1cs(char.Parse(Console.ReadLine().ToLower()));
            bool r1 = p1.Opcao();

            if(r1 == true)
            {
                Console.WriteLine("You reprogram the module and become the second person to beat the no-win scenario. How original of you.");
                f.Falhou();
            }
            else
            {
                Pergunta2 p2 = new Pergunta2();
                p2.p2();
            }
        }

       
    }
}