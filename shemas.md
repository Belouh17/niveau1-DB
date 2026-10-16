Etape 1
Plat (**id** , nom ,prix) (nouveau)
=> Je choisi l identification Integer 

Etape 2
Categorie (**id** , nom) (nouveau)
Plat (**id** , nom , prix , #id_categorie) (modifier)
=> Pourquoi ne pas simplement ajouter une colonne categorie VARCHAR(50) dans la table des
plats ? 
car si on ajoute juste une cologne categorie varchar(50) dans le plat , alors on ne peut pas identifier le categorie , car si en veut regroupe les meme categorie alors le syntaxe de chaque categorie doit donc le meme pour ne pas creer une erreur 



