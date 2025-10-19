create table trait(
id_trait varchar(50) primary key,
description_trait varchar(50) not null );

create table acteur_doubleur(
 id_acteur varchar(50) primary key,
 nom_acteur varchar(50) not null,
 nationalité_acteur varchar(50));
 
 create table oeuvre(
 id_oeuvre varchar(50) primary key,
 titre_oeuvre varchar(50) not null,
 type_oeuvre varchar(50) not null,
 annee_sortie int,
 studio_auteur varchar(50),
 auteur varchar(50) not null,
 illustrateurs varchar(50),
 editeur_jeux_video varchar(50),
 maison_edition varchar(50),
 pays_oeuvre varchar(50) not null);
 
 create table personnage(
 id_perso varchar(50) primary key,
 nom_perso varchar(50) not null,
 surnom_perso varchar(50),
 sexe_perso varchar(50),
 date_naissance_perso DATE,
 description_biographie varchar(50) not null,
 statut_mort_vivant_inconnu varchar(50));
 
  create table source(
 id_source varchar(50) primary key,
 titre_source varchar(50) not null,
 url_source varchar(50),
 type_source varchar(50) not null,
 date_consultation DATE);
 
 create table contribution(
 id_contribution varchar(50) primary key,
 type_action varchar(50) not null,
 date_heure_contribution int,
 element_concerne varchar(50) not null,
 commentaire_contribution varchar(50),
 foreign key (id_source) references source(id_source));
 
 
 create table utilisateur(
 id_user varchar(50) primary key,
 pseudo_user varchar(50) unique,
 email_user varchar(50) not null,
 role_user varchar(50));
 
 create table perso_trait(
 id_pp_trait varchar(50),
 foreign key (id_trait) references trait(id_trait),
 foreign key (id_perso) references personnage(id_perso));
 
 create table apparition(
 id_apparition varchar(50) primary key,
 role_libelle varchar(50),
 foreign key (id_oeuvre) references oeuvre(id_oeuvre),
 foreign key (id_perso) references personnage(id_perso),
 foreign key(id_acteur) references acteur_doubleur(id_acteur));
 
 create table relation(
 id_relation varchar(50) primary key,
 type_relation  varchar(50),
 id_perso_source varchar(50),
 id_perso_cible varchar(50),
 foreign key (id_oeuvre) references oeuvre(id_oeuvre));
 
 create table modifie_perso(
 foreign key (id_perso) references personnage(id_perso),
 foreign key(id_user) references utilisateur(id_user));
 
 create table fait_par(
 foreign key (id_contribution) references contribution(id_contribution),
 foreign key(id_user) references utilisateur(id_user));
 
 create table modifie_acteur(
 foreign key (id_acteur) references acteur_doubleur(id_acteur),
 foreign key(id_user) references utilisateur(id_user));
 
 create table cite_source(
 foreign key (id_source) references source(id_source),
 foreign key(id_contribution) references contribution(id_contribution));
 
 create table interpretation(
 role_joue varchar(50) not null,
 langue_interpretation varchar(50) not null,
 foreign key (id_acteur) references acteur_doubleur(id_acteur),
 foreign key(id_perso) references perso(id_perso));
 