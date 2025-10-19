alter table personnage add prenom_perso varchar(50);

alter table personnage add constraint chk_sexe check (sexe_perso in ('homme', 'femme', 'autre', 'inconnu'));

alter table personnage add constraint chk_statut check (statut_mort_vivant_inconnu in ('mort', 'vivant', 'inconnu'));

alter table oeuvre add genre_oeuvre varchar(50);

alter table oeuvre add constraint chk_genre_oeuvre check (genre_oeuvre in ('comédie', 'horreur', 'romantique', 'shojo', 'shonen', 'action', 'autre'));

alter table oeuvre add constraint chk_type_oeuvre check (type_oeuvre in ('film', 'série', 'jeux vidéo', 'livre', 'bd', 'manga', 'autre'));

alter table utilisateur add age_user int;

alter table utilisateur add colonne_fiable varchar(10);

alter table utilisateur add constraint chk_role_fiable check (
    (role_user <> 'modérateur')
    or (colonne_fiable = 'oui'));

alter table utilisateur add constraint chk_email check (email_user like '%@%.%');

alter table source add constraint chk_type_source check (type_source in ('site web', 'livre', 'article', 'autre'));

alter table contribution add constraint chk_type_action check (type_action in ('ajout', 'modification', 'suppression'));

alter table interpretation add constraint chk_langue check (langue_interpretation in ('fr', 'en', 'jp','autre'));
