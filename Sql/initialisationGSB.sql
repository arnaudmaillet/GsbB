DROP database IF EXISTS gsb;

CREATE database gsb;

USE gsb;

CREATE TABLE Personnel (
	id INT auto_increment ,
    nom CHAR(25) NOT NULL,
    prenom CHAR(30) NOT NULL,
    rue VARCHAR(50) NOT NULL,
    ville VARCHAR(50) NOT NULL,
    codePostal char(5) NOT NULL,
    telephonePortable CHAR(10) NULL,
    telephonePro CHAR(10) NULL,
    email VARCHAR(254) NULL,
	dateEmbauche date NOT NULL,
    PRIMARY KEY (id)
) engine = InnoDB;

-- Table contenant les visiteurs.
CREATE TABLE Visiteur (
	idVisiteur INT ,
    PRIMARY KEY (idVisiteur),
	foreign key(idVisiteur) references personnel(id)
) engine = InnoDB;


-- Table contenant les comptables.
CREATE TABLE Comptable (
	idComptable INT ,
    PRIMARY KEY (idComptable),
	foreign key(idComptable) references personnel(id)
) engine = InnoDB;

-- Table contenant le chef comptable parmis les comptables.
CREATE TABLE ChefComptable (
	idChefComptable INT ,
    PRIMARY KEY (idChefComptable),
	foreign key(idChefComptable) references comptable(idComptable)
) engine = InnoDB;

SET SQL_SAFE_UPDATES = 0;

INSERT INTO personnel (nom, prenom, dateEmbauche, rue, ville, codePostal ) VALUES
( 'dupont', 'Pierre', '2009-01-01', '5 rue des Trois Cailloux', 'Amiens', '80000'),
( 'smith', 'Samantha', '2005-01-01', '14 rue des hortillonages', 'Amiens', '80000'),
( 'Deloubrière', 'Bill', '1985-01-01', '7 rue de l"abbaye', 'Amiens', '80000'),
( 'Duclou', 'Robert', '1990-12-24', '2 rue des otages', 'Amiens', '80000'),
( 'Foucambergue', 'Bernard', '1979-06-14', '5 rue de l"Armistice', 'Beauval', '80630'),
('Petit', 'Isabelle', '1994-03-27', '12 rue du Général De Gaulle', 'Camon', '80450');

insert into comptable values (1), (2), (3), (4), (5), (6);
insert into chefComptable values (6);

insert into personnel(nom, prenom, rue, codePostal, ville, dateEmbauche) values
	 ('Andre','David','1 r Aimon de Chissée','80000','AMIENS','1991-08-26'),
	 ('Ansart', 'Alexis', '4 r des buissons', '2A100', 'BASTIA', '1985-09-20'),
	 ('Bedos','Christian','1 r Bénédictins','65000','TARBES','1987-07-17'),
	 ('Tusseau','Louis','22 r Renou','86000','POITIERS','1999-01-02'),
	 ('Bentot','Pascal','11 av 6 Juin','67000','STRASBOURG','1996-03-11'),
	 ('Bioret','Luc','1 r Linne','35000','RENNES','1997-03-21'),
	 ('Bunisset','Francis','10 r Nicolas Chorier','85000','LA ROCHE SUR YON','1999-01-31'),
	 ('Bunisset','Denise','1 r Lionne','49100','ANGERS','1994-07-03'),
	 ('Cacheux','Bernard','114 r Authie','34000','MONTPELLIER','2000-08-02'),
	 ('Cadic','Eric','123 r Caponière','41000','BLOIS','1993-12-06'),
	 ('Charoze','Catherine','100 pl Géants','33000','BORDEAUX','1997-09-25'),
	 ('Clepkens','Christophe','12 r Fédérico Garcia Lorca','13000','MARSEILLE','1998-01-18'),
	 ('Cottin','Vincenne','36 sq Capucins','05000','GAP','1995-10-21'),
	 ('Daburon','François','13 r Champs Elysées','06000','NICE','1989-02-01'),
	 ('Debeauvais','Philippe','13 r Charles Peguy','10000','TROYES','1992-05-05'),
	 ('Debelle','Michel','181 r Caponière','88000','EPINAL','1991-04-09'),
	 ('Debelle','Jeanne','134 r Stalingrad','44000','NANTES','1991-12-05'),
	 ('Debroise','Michel','2 av 6 Juin','70000','VESOUL','1997-11-18'),
	 ('Desmarquest','Nathalie','14 r Fédérico Garcia Lorca','54000','NANCY','1989-03-24'),
	 ('Desnost','Pierre','16 r Barral de Montferrat','55000','VERDUN','1993-05-17'),
	 ('Dudouit','Frédéric','18 quai Xavier Jouvin','75000','PARIS','1988-04-26'),
	 ('Duncombe','Claude','19 av Alsace Lorraine','09000','FOIX','1996-02-19'),
	 ('Enault-Pascreau','Céline','25B r Stalingrad','40000','MONT DE MARSAN','1990-11-27'),
	 ('Eynde','Valérie','3 r Henri Moissan','76000','ROUEN','1991-10-31'),
	 ('Finck','Jacques','rte Montreuil Bellay','74000','ANNECY','1993-06-08'),
	 ('Frémont','Fernande','4 r Jean Giono','69000','LYON','1997-02-15'),
	 ('Gest','Alain','30 r Authie','46000','FIGEAC','1994-05-03'),
	 ('Gombert','Luc','32 r Emile Gueymard','56000','VANNES','1985-10-02'),
	 ('Guindon','Caroline','40 r Mar Montgomery','87000','LIMOGES','1996-01-13'),
	 ('Guindon','François','44 r Picotière','19000','TULLE','1993-05-08'),
	 ('Igigabel','Guy','33 gal Arlequin','94000','CRETEIL','1998-04-26'),
	 ('Jourdren','Pierre','34 av Jean Perrot','15000','AURRILLAC','1993-08-26'),
	 ('Juttard','Pierre-Raoul','34 cours Jean Jaurès','08000','SEDAN','1992-11-01'),
	 ('Labouré-Morel','Saout','38 cours Berriat','52000','CHAUMONT','1998-02-25'),
	 ('Landré','Philippe','4 av Gén Laperrine','59000','LILLE','1992-12-16'),
	 ('Langeard','Hugues','39 av Jean Perrot','93000','BAGNOLET','1998-06-18'),
	 ('Lanne','Bernard','4 r Bayeux','30000','NIMES','1996-11-21'),
	 ('Lebeau','Noël','4 av Beauvert','68000','MULHOUSE','1983-03-23'),
	 ('Lebel','Jean','39 r Raspail','53000','LAVAL','1995-02-02'),
	 ('Leclercq','Servane','11 r Quinconce','18000','BOURGES','1995-06-05'),
	 ('Lecornu','Jean-Bernard','4 bd Mar Foch','72000','LA FERTE BERNARD','1997-01-24'),
	 ('Lecornu','Ludovic','4 r Abel Servien','25000','BESANCON','1996-02-27'),
	 ('Lejard','Agnès','4 r Anthoard','82000','MONTAUBAN','1987-10-06'),
	 ('Lesaulnier','Pascal','47 r Thiers','57000','METZ','1990-10-13'),
	 ('Letessier','Stéphane','5 chem Capuche','27000','EVREUX','1996-03-06'),
	 ('Loirat','Didier','Les Pêchers cité Bourg la Croix','45000','ORLEANS','1992-08-30'),
	 ('Maffezzoli','Thibaud','5 r Chateaubriand','02000','LAON','1994-12-19'),
	 ('Mancini','Anne','5 r D''Agier','48000','MENDE','1995-01-05'),
	 ('Marcouiller','Gérard','7 pl St Gilles','91000','ISSY LES MOULINEAUX','1992-12-24'),
	 ('Michel','Jean-Claude','5 r Gabriel Péri','61000','FLERS','1992-12-14'),
	 ('Montecot','Françoise','6 r Paul Valéry','17000','SAINTES','1998-07-27'),
	 ('Notini','Veronique','5 r Lieut Chabal','60000','BEAUVAIS','1994-12-12'),
	 ('Onfroy','Den','5 r Sidonie Jacolin','37000','TOURS','1977-10-03'),
	 ('Pascreau','Charles','57 bd Mar Foch','64000','PAU','1997-03-30'),
	 ('Pernot','Claude-Noël','6 r Alexandre 1 de Yougoslavie','11000','NARBONNE','1990-03-01'),
	 ('Perrier','Maître','6 r Aubert Dubayet','71000','CHALON SUR SAONE','1991-06-23'),
	 ('Petit','Jean-Louis','7 r Ernest Renan','50000','SAINT LO','1997-09-06'),
	 ('Piquery','Patrick','9 r Vaucelles','14000','CAEN','1984-07-29'),
	 ('Quiquandon','Joël','7 r Ernest Renan','29000','QUIMPER','1990-06-30'),
	 ('Retailleau','Josselin','88Bis r Saumuroise','39000','DOLE','1995-11-14'),
	 ('Retailleau','Pascal','32 bd Ayrault','23000','MONTLUCON','1992-09-25'),
	 ('Souron','Maryse','7B r Gay Lussac','21000','DIJON','1995-03-09'),
	 ('Tiphagne','Patrick','7B r Gay Lussac','62000','ARRAS','1996-08-29'),
	 ('Tréhet','Alain','7D chem Barral','12000','RODEZ','1994-11-29'),
	 ('Tusseau','Josselin','63 r Bon Repos','28000','CHARTRES','1991-03-29');

# génération des emails
     
update personnel 
   set email = concat(lcase(nom), ".", lcase(prenom), "@gsb.com");

# génération des informations manquantes : téléphone
-- génération des numéros de téléphone

update personnel 
   set telephonePortable = concat('06', id % 9, id * 2 % 9, id % 7, id % 9 , id * 24  % 9, id * 33 % 9, id * 8  % 9, id * 29 % 9)
   where telephonePortable is null;

update personnel 
   set telephonePro = concat('07', id % 9, id * 2 % 9,  id % 7 , id % 9 , id * 24  % 9, id * 33 % 9, id * 8  % 9, id * 29 % 9)
   where telephonePro is null;


insert into visiteur (select id from personnel where id > 6);

select * from personnel;
select * from comptable;
select * from chefcomptable;
select * from visiteur;