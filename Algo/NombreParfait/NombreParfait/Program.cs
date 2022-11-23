namespace NombreParfait
{
    internal class Program
    {
        static void Main(string[] args)
        {
            /*
             * VARIABLE
             * Entier nombreATrouver           //nombre de nombre parfait à afficher
             * Liste<entier> listeDiviseur    //List des diviseurs
             * Entier nombreParfaitTrouvé    //compteur de nombre parfait trouvé
             * Entier sommeDiviseur         //stock la somme des entiers
             * Entier nombreCourant        //nombre que l'on test  
             * 
             * TRAITEMENT
             * Ecrire "Bonjour, vous êtes sur le programme qui vous affiche une certaine quantité de nombres parfaits"
             * Ecrire "Combien de nombre parfait souhaitez vous connaitre ? (réponse en dessous de 4 attendu)"
             * nombreATrouver <-- GetUserInput()
             * Tant que nombreParfaitTrouvé est inférieur à nombreATrouver 
             *   sommeDiviseur <-- 1
             *   listeDiviseur <-- TrouveDiviseur(nombreCourant)
             *    pour chaque diviseurCourant dans listeDiviseur faire 
             *     sommeDiviseur <-- sommeDiviseur + diviseurCourant
             *    fin pour chaque
             *    si sommeDiviseur est égale à nombreCourant
             *     nombreParfaitTrouvé <-- nombreParfaitTrouvé + 1
             *     Ecrire nombreCourant, " est un nombre parfait."
             *    fin si
             *    nombreCourant <-- nombreCourant +1
             * fin Tant que
             * 
             *  
             * AFFICHAGE
             * 
             * FONCTION
             * GetUserInput(): entier
             * TrouveDiviseur(entier) : Liste<entier>
            */
        }

        int NombreATrouver;
        List<int> listeDiviseur;
        int nombreParfaitATrouver;
        int sommeDiviseur;
        int nombreCourant;

    }
}