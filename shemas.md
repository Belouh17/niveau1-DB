Etape 1
Plat (**id** , nom ,prix) (nouveau)
=> Je choisi l identification Integer 

Etape 2
Categorie (**id** , nom) (nouveau)
Plat (**id** , nom , prix , #id_categorie) (modifier)
=> Pourquoi ne pas simplement ajouter une colonne categorie VARCHAR(50) dans la table des
plats ? 
car si on ajoute juste une cologne categorie varchar(50) dans le plat , alors on ne peut pas identifier le categorie , car si en veut regroupe les meme categorie alors le syntaxe de chaque categorie doit donc le meme pour ne pas creer une erreur 

Etape 3
CATEGORIE (**id**, nom)
PLAT (**id**, nom, prix, #id_categorie)
COMMANDE (**id**, date_commande)                                  (nouveau)
LIGNE_COMMANDE (**#id_commande**, **#id_plat**, quantite)         (nouveau)
=> car la quantité dépend à la fois de la commande et du plat

Etape 4 
CATEGORIE (**id**, nom)
PLAT (**id**, nom, prix, #id_categorie)
CLIENT (**id**, nom)                                              (nouveau)
COMMANDE (**id**, date_commande, #id_client?)                     (modifié)
LIGNE_COMMANDE (**#id_commande**, **#id_plat**, quantite)
=> Non : id_client est facultatif (NULL autorisé) ,car la plupart des clients sont de passage et on ne leur demande rien.alors on peut faire null sur l'id_client 


