{
//L'algorithme est d'une vertion encore plus ancienne n'integrant pas le randomize
//Cet algo est malgré tout le plus recent.
ALGO jeu_de_l_oie
//BUT : Faire un jeu de l'oie fonctionnel.
//ENTREE : Jets de dés de l'utilisateur.
//SORTIE : Sa position, et l'effet de la case sur laquelle il est.

CONST 	CASEMORT<-58:entier
	CASEDEPART<-0:entier
	CASEFINALE<-66:entier
	
VAR	deplacement,plateau,sortie:entier
	

DEBUT
ECRIRE "Voici le jeu de l'oie! Tirez 2 dés à 6 faces chez vous, puis écrivez le
	résultat dans le programme qui calculera votre position!"
plateau<-0
REPETER
	ECRIRE "Ecrivez le résultat de vos dés :"
	LIRE deplacement
	SI deplacement>=2 ET deplacement<=12
		plateau<-plateau+deplacement
		ECRIRE "Vous ettes actuellement sur la case : "&plateau
		SI plateau=CASEMORT ALORS
			ECRIRE "Vous ettes tombé sur la case mort 
				qui vous ramene à la case départ!"
			plateau<-CASEDEPART
		SINON 
			SI plateau=CASEFINALE ALORS
				ECRIRE "Vous avez gagné! Bravo!"
				sortie<-1
			SINON
				SI plateau>CASEFINALE ALORS
					ECRIRE "Comme vous ettes case "&plateau&", vous ettes trop loin,
						vous reculez donc de "&CASEFINALE-plateau&" cases!"
					plateau<-plateau+(CASEFINALE-plateau)
					ECRIRE "Vous ettes actuellement sur la case : "&plateau
				SINON
					SI plateauMOD9=0 ET plateauDIV9<>63 ALORS
						ECRIRE "Case compte double! Votre déplacement est
							multiplié par 2!²
						plateau<-plateau+deplacement
					FINSI //fin test case double
				FINSI //fin test excedent case finale
			FINSI //fin test case finale
		FINSI //fin test case mort
	SINON
	ECRIRE "Votre nombre n'est pas valide!"
	FINSI //fin test deplacement
JUSQU'A sortie=1
ECRIRE "En esperant que vous vous soyez amusé, et bonne journée!"
FIN
}

program jeu_de_l_oie;

uses crt;

//BUT : Faire un jeu de l'oie fonctionnel.
//ENTREE : Jets de dés de l'utilisateur.
//SORTIE : Sa position, et l'effet de la case sur laquelle il est.


CONST 	
	CASEMORT=58;
	CASEDEPART=0;
	CASEFINALE=66;
	
VAR	
	deplacement,plateau,sortie:integer;


BEGIN
	clrscr;
	randomize;
	writeln('Voici le jeu de l oie! Entrez n importe quoi pour que le programme lance 2 des 6 quoi! Entrez 0 pour sortir!'); //penser a l'apostrophe
	plateau:=0;
	REPEAT
		BEGIN
			readln;

			deplacement:=(2+random(11));
			writeln('Votre jet de des vaut ',deplacement);
				plateau:=plateau+deplacement;
				writeln('Vous etes actuellement sur la case : ',plateau);

				IF (plateau=CASEMORT) THEN //test casemort
				BEGIN
					writeln('Vous etes tombe sur la case mort qui vous ramene a la case depart!');
					plateau:=CASEDEPART
				END
				ELSE //test casemort
				BEGIN
					IF (plateau=CASEFINALE) THEN //test casefinale
					BEGIN
						writeln('Vous avez gagne! Bravo!');
						sortie:=1;
					END
					ELSE //test casefinale
					BEGIN
						IF (plateau>CASEFINALE) THEN //test excedent
						BEGIN
							deplacement:=plateau-66;
							writeln('Comme vous etes trop loin, vous reculez!');
							plateau:=66-deplacement;
							writeln('Vous etes actuellement sur la case : ',plateau);
						END
						ELSE //test excedent
						BEGIN
							IF ((plateau mod 9)=0) AND ((plateau div 9)<>63) THEN //test case double
							BEGIN
								writeln('Case compte double! Votre deplacement est multiplie par 2!');
								plateau:=plateau+deplacement;
								writeln('Vous etes actuellement sur la case : ',plateau);
							END; //test case double
						END; //test excedent
					END; //test casefinale
				END; //test casemort

		END;
	UNTIL sortie=1;
	writeln('En esperant que vous vous soyez amuse, et bonne journee!');
	readln();
END.
