SELECT nom_perso, prenom_perso, sexe_perso, statut_mort_vivant_inconnu FROM personnage
WHERE sexe_perso = 'femme' AND statut_mort_vivant_inconnu = 'vivant' ORDER BY nom_perso ASC;

SELECT nom_acteur, nationalité_acteur FROM acteur_doubleur
WHERE nationalité_acteur IN ('États-Unis', 'France');

SELECT titre_oeuvre, type_oeuvre, annee_sortie, pays_oeuvre FROM oeuvre
WHERE annee_sortie BETWEEN 1995 AND 2025 ORDER BY annee_sortie;

SELECT nom_perso, prenom_perso FROM personnage
WHERE nom_perso LIKE 'E';

SELECT titre_oeuvre, genre_oeuvre, type_oeuvre FROM oeuvre
WHERE type_oeuvre IN ('film', 'série') AND genre_oeuvre = 'action' ORDER BY titre_oeuvre;

SELECT o.titre_oeuvre FROM oeuvre o
WHERE NOT EXISTS (
  SELECT 1 FROM apparition ap
  WHERE ap.id_oeuvre = o.id_oeuvre);
  
SELECT nom_perso FROM personnage p
WHERE SELECT COUNT(*) FROM perso_trait pt WHERE pt.id_perso = p.id_perso 
SELECT AVG(nb_trait) FROM (SELECT COUNT(*) AS nb_trait FROM perso_trait GROUP BY id_perso) AS moy;
  
SELECT statut_mort_vivant_inconnu, COUNT(*) AS nb_perso FROM personnage
GROUP BY statut_mort_vivant_inconnu HAVING COUNT(*) > 5;

SELECT role_user, ROUND(AVG(age_user), 1) AS age_moyen FROM utilisateur
GROUP BY role_user;

SELECT genre_oeuvre, COUNT(*) AS nb_oeuvres FROM oeuvre
GROUP BY genre_oeuvre ORDER BY nb_oeuvres;

SELECT sexe_perso, COUNT(*) AS nb_personnages FROM personnage
GROUP BY sexe_perso;

SELECT c.id_contribution, c.type_action, c.element_concerne, c.commentaire_contribution, c.date_heure_contribution FROM contribution c
JOIN fait_par f ON c.id_contribution = f.id_contribution JOIN utilisateur u ON f.id_user = u.id_user
WHERE u.pseudo_user = 'ContribFan01'
ORDER BY c.date_heure_contribution;

SELECT p.nom_perso, p.prenom_perso, p.statut_mort_vivant_inconnu, p.sexe_perso, p.description_biographie FROM personnage p
JOIN modifie_perso mp ON mp.id_perso = p.id_perso JOIN utilisateur u ON mp.id_user = u.id_user
WHERE u.pseudo_user = 'ContribFan01'
ORDER BY p.nom_perso;

SELECT DISTINCT p.nom_perso FROM personnage p
JOIN apparition ap ON p.id_perso = ap.id_perso
JOIN acteur_doubleur a ON ap.id_acteur = a.id_acteur
WHERE a.nom_acteur = ANY (SELECT a2.nom_acteur FROM apparition ap2
JOIN oeuvre o2 ON ap2.id_oeuvre = o2.id_oeuvre JOIN acteur_doubleur a2 ON ap2.id_acteur = a2.id_acteur
WHERE o2.titre_oeuvre = 'Avengers');

SELECT nom_acteur FROM acteur_doubleur
WHERE id_acteur IN SELECT id_acteur FROM apparition ap
JOIN oeuvre o ON ap.id_oeuvre = o.id_oeuvre
WHERE o.pays_oeuvre = 'Japon';

SELECT p.nom_perso, a.nom_acteur, a.nationalité_acteur FROM personnage p
JOIN apparition ap ON p.id_perso = ap.id_perso JOIN acteur_doubleur a ON ap.id_acteur = a.id_acteur 
JOIN modifie_perso mp ON mp.id_perso = p.id_perso JOIN utilisateur u ON mp.id_user = u.id_user
WHERE u.pseudo_user = 'ContribFan01' ORDER BY a.nom_acteur;

SELECT o.titre_oeuvre, p.nom_perso FROM oeuvre o
LEFT JOIN apparition ap ON o.id_oeuvre = ap.id_oeuvre LEFT JOIN personnage p ON ap.id_perso = p.id_perso;

SELECT r.type_relation, ps.nom_perso AS source, pc.nom_perso AS cible FROM relation r
JOIN personnage ps ON r.id_perso_source = ps.id_perso JOIN personnage pc ON r.id_perso_cible = pc.id_perso;