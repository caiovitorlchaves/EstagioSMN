namespace teste.Entities
{
    public class Funcl
   {
       public Funcl()
       {
           
       }
        

        public void Func(string texto) //Metodo
        {
            Console.Clear();
            char[] letras  = texto.ToCharArray();
            for (int i = 0; i < letras.Length; i++)
            {
                System.Console.Write(letras[i]); 
                Thread.Sleep (200);
            }
        }
        
    }
}