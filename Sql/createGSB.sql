# Création des tables Version 3 : table tarifKm et table des états
USE gsb;

-- table paramètre
create table Parametre( 
 tarifNuitee decimal(5,2) not null default 60.00,
 tarifRepas decimal(4,2) not null default 25.00, 
 tarifEtape decimal(5,2) not null default 80.00);
 
 insert into parametre values ();

create table EtatFiche(
	id char(1) not null, 
    libelle varchar(20) not null,
    PRIMARY KEY (id)
) engine = InnoDB;

insert into EtatFiche(id, libelle) values
	('C', 'En création'),
	('E', 'Enregistrée'),
	('A', 'En attente'),
	('V', 'Validé'),
	('P', 'Mise en paiement');

    
Create table EtatFraisHorsForfait(
	id char(1) not null, 
    libelle varchar(20) not null,
    PRIMARY KEY (id)
) engine = InnoDB;

insert into EtatFraisHorsForfait(id, libelle) values
	('C' , 'Crée'),
	('A', 'En attente'),
	('V', 'Validé'),
	('R', 'Refusé');



create table TarifKm(
    id tinyint not null, 
    libelle varchar(30) not null,
    tarifKm decimal(4,3) not null,
    PRIMARY KEY (id)
) engine = InnoDB;

insert into TarifKm(id, libelle, tarifKm) values 
(1,	'Véhicule 4CV', 0.518),
(2,	'Véhicule 5 CV', 0.543),
(3,	'Véhicule 6 CV', 0.568),
(4, 'Véhicule 7 CV et plus', 0.595);


-- Table pour les fiches de frais 

 CREATE TABLE FicheFrais (
	id INT AUTO_INCREMENT,
    nbNuitee INT not null DEFAULT 0,
    nbRepas INT not null DEFAULT 0,
    nbEtape INT not null DEFAULT 0,
    nbKm INT NOT NULL,
    montant decimal(6,2) NOT NULL,
	dateCreation date not null,
	dateEnregistrement date null,
	dateMiseEnattente date null,
	dateValidation date null,
	DateMiseEnPaiement date null,
	idEtat char(1) not null default "C",
	idVisiteur INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (idVisiteur) REFERENCES visiteur (idVisiteur),
	Foreign Key (idEtat) references etatFiche(id)
) engine = InnoDB;

-- Table pour les frais supplémentaires qui ne sont pas dans inclus dans la table 'frais'.
-- FraisHorsForfaitFiche(id, libelle, montant, commentaire, etat, idFiche)
CREATE TABLE FraisHorsForfait(
	id INT AUTO_INCREMENT,
    date DATE NOT NULL,
    libelle VARCHAR(150) NOT NULL,
    montant decimal(6,2) NOT NULL,
	etat char(1) not null default "C",
	idFicheFrais int not null,
    PRIMARY KEY (id),
	foreign key (idFicheFrais) references FicheFrais(id),
	foreign key (etat) references EtatFraisHorsforfait(id)
) engine = InnoDB;

-- Modification sur la table Personnel afin de permettre une connexion à l'application.
Alter TABLE Personnel 
	add login CHAR(8) not null,
	add motDePasse VARCHAR(20) NOT NULL;

update Personnel set 
	login = concat(lcase(LEFT(nom, 4)), lcase(left(prenom, 4))), 
	motDePasse = '1111';

-- Modification sur la table visiteur afin d'enregistrer le tarif kilométrique
Alter TABLE visiteur 
    add idTarifKm tinyint not null;

# la contrainte d'intégrité ne peut être mise en oeuvre qu'après avoir placé des valeurs dans la clé étrangère car cette dernière n'accepte pas la valeur null

update Visiteur
   set idTarifKm = idVisiteur % 4 + 1;
   
Alter TABLE visiteur 
    add foreign key (idTarifKm) references tarifKm(id);   

Select * from parametre;
Select * from etatFiche;
Select * from etatFraisHorsForfait;
Select * from personnel;
Select * from visiteur;
select * from fichefrais;
select * from fraishorsforfait;

insert into fichefrais values
(3,3,2,3,40,120,10/02/2012,null, 11/02/2012,null,null,"E",10),
(4,3,2,3,40,120,10/02/2012,null, 11/02/2012,null,null,"E",10),
(5,3,2,3,40,120,10/02/2012,null, 11/02/2012,null,null,"P",10),
(6,3,2,3,40,120,10/02/2012,null, 11/02/2012,null,null,"P",10),
(7,3,2,3,40,120,10/02/2012,null, 11/02/2012,null,null,"V",10),
(8,3,2,3,40,120,10/02/2012,null, 11/02/2012,null,null,"V",10)
;
insert into fraishorsforfait values(1, 10/02/2012, "achat CB", 12, "V", 1);


    SELECT fichefrais.id, nbNuitee, nbRepas , nbKm, dateCreation 
    FROM fichefrais
    WHERE idEtat = "C";
    
    SELECT tarifNuitee, tarifRepas, tarifEtape
    FROM parametre;

create view affichagefichefrais as
select fichefrais.id, dateCreation, nbNuitee, nbRepas, nbKm, tarifKm, tarifNuitee, tarifRepas, tarifEtape, idEtat
from fichefrais, tarifkm, visiteur, parametre
where tarifkm.id = visiteur.idTarifKm
and idEtat = "C"
and visiteur.idVisiteur = fichefrais.idVisiteur;

SELECT id, dateCreation, nbNuitee, nbRepas, nbKm, tarifKm
    FROM affichagefichefrais;

