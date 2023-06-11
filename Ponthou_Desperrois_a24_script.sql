DROP SCHEMA IF EXISTS "sae204_a24" CASCADE;

create schema "sae204_a24";

set schema 'sae204_a24';

CREATE TABLE _rang_dernier_appele_selon_regroupement(
    rang_dernier_appele INT,
    libelle_regroupement_rang_dernier_appele_selon_regroupement VARCHAR(69),
    cod_aff_form_rang_dernier_appele_selon_regroupement VARCHAR(6),
    session_annee_rang_dernier_appele_selon_regroupement INT,
    PRIMARY KEY(libelle_regroupement_rang_dernier_appele_selon_regroupement, cod_aff_form_rang_dernier_appele_selon_regroupement, session_annee_rang_dernier_appele_selon_regroupement)
);

CREATE TABLE _regroupement(
    libelle_regroupement VARCHAR(69) PRIMARY KEY 
);

CREATE TABLE _session(
    session_annee INT,
    primary key(session_annee)
);

CREATE TABLE _admissions_generalites(
    -- a voir je sais pas si je créer une clé primaire avec cod_aff_form et session_annee à voir AVEC YANNIS 
    -- IMPERATIVEMENT

    selectivite VARCHAR(25),
    capacite INT,
    effectif_total_candidats INT,
    effectif_total_candidates INT,
    cod_aff_form_admissions_generalites VARCHAR(6) NOT NULL,
    session_annee_admissions_generalites INT,
    PRIMARY KEY(cod_aff_form_admissions_generalites, session_annee_admissions_generalites)
);

CREATE TABLE _mention_bac(
    libelle_mention VARCHAR(30), 
    primary key(libelle_mention)
);

CREATE TABLE _type_bac(
    type_bac VARCHAR(18),
    primary key(type_bac)
);

CREATE TABLE _effectif_selon_mention(
    effectif_admis_neo_bac_selon_mention INT,
    session_annee_effectif_selon_mention INT,
    cod_aff_form_effetif_selon_mention VARCHAR(6),
    libelle_mention_effectif_selon_mention VARCHAR(30), 
    PRIMARY KEY (session_annee_effectif_selon_mention,cod_aff_form_effetif_selon_mention,libelle_mention_effectif_selon_mention)
);




Create table _filière (
    filiere_id  Int,
    filiere_libelle  varchar(224) not null,
    filiere_libelle_tres_abrege  varchar(19),
    filiere_libelle_abrege  varchar(69) not null,
    filiere_libelle_detaille_bis  varchar(112) ,
    primary key(filiere_id) 
);

Create table _académie (
    académie_nom  varchar(22),
    primary key(académie_nom)
);

Create table  _etablissement(
    etablissement_code_uai varchar(9),
    etablissement_nom varchar(128) not null,
    etablissement_statut varchar(34) not null,
    primary key(etablissement_code_uai)
);




Create table _formation(
    cod_aff_form  varchar(6),
    filiere_libelle_detaille varchar(267) ,
    coordonnees_gps varchar(22) not null,
    list_com varchar(46) ,
    concours_communs_banque_epreuve varchar(47) not null,
    url_formation varchar(92),
    tri varchar(20) ,
    primary key(cod_aff_form),
    departement_code_formation varchar(4) NOT NULL,
    academie_nom_formation varchar(22) NOT NULL,
    etablissement_code_uai_formation varchar(9) NOT NULL,
    commune_nom_formation varchar(29)NOT NULL,
    filiere_id_formation int NOT NULL,
    département_code_formation varchar(4)
    
);

Create table _région(
    region_nom varchar(30),
    primary key(region_nom)
);

Create table _département(
    commune_nom_département varchar(30) not null,
    département_code varchar(4),
    département_nom varchar(24) not null,
    region_nom_département varchar(30) NOT NULL,
    primary key(département_code)
);



CREATE table _commune(
    commune_nom varchar(29),
    département_code_commune varchar(4) NOT NULL,
    primary key(commune_nom,département_code_commune)
);


CREATE TABLE _admissions_selon_type_neo_bac(
    effectif_candidat_neo_bac_classes INT,
    type_bac_admissions_selon_type_neo_bac varchar(18),
    cod_aff_form_admissions_selon_type_neo_bac varchar(6),
    session_annee_admissions_selon_type_neo_bac INT,
    PRIMARY KEY(type_bac_admissions_selon_type_neo_bac, cod_aff_form_admissions_selon_type_neo_bac, session_annee_admissions_selon_type_neo_bac)
    
);

-- contraintes de la table _admissions_selon_type_neo_bac


ALTER TABLE _admissions_selon_type_neo_bac
ADD CONSTRAINT _admissions_selon_type_neo_bac_fk_Type_bac FOREIGN KEY(type_bac_admissions_selon_type_neo_bac) REFERENCES _type_bac(type_bac);

ALTER TABLE _admissions_selon_type_neo_bac
ADD CONSTRAINT _admissions_selon_type_neo_bac_fk_Formation FOREIGN KEY(cod_aff_form_admissions_selon_type_neo_bac) REFERENCES _formation(cod_aff_form);

ALTER TABLE _admissions_selon_type_neo_bac
ADD CONSTRAINT _admissions_selon_type_neo_bac_fk_Session FOREIGN KEY(session_annee_admissions_selon_type_neo_bac) REFERENCES _session(session_annee);


-- Contraintes de la table Rang_dernier_appele_selon_regroupement

ALTER TABLE _rang_dernier_appele_selon_regroupement
ADD CONSTRAINT _rang_dernier_appele_selon_regroupement_fk_Regroupement FOREIGN KEY(libelle_regroupement_rang_dernier_appele_selon_regroupement) REFERENCES _regroupement(libelle_regroupement);

ALTER TABLE _rang_dernier_appele_selon_regroupement
ADD CONSTRAINT _rang_dernier_appele_selon_regroupement_fk_Formation FOREIGN KEY(cod_aff_form_rang_dernier_appele_selon_regroupement) REFERENCES _formation(cod_aff_form);

ALTER TABLE _rang_dernier_appele_selon_regroupement
ADD CONSTRAINT _rang_dernier_appele_selon_regroupement_fk_Session FOREIGN KEY (session_annee_rang_dernier_appele_selon_regroupement) REFERENCES _session(session_annee);






-- Contraintes de la table Formation 

ALTER TABLE _formation
ADD CONSTRAINT _formation_fk_Académie FOREIGN KEY (academie_nom_formation) REFERENCES _académie (académie_nom) ;

ALTER TABLE _formation 
ADD CONSTRAINT _formation_fk_Etablissement FOREIGN KEY(etablissement_code_uai_formation) REFERENCES _etablissement(etablissement_code_uai) ;

ALTER TABLE _formation
ADD CONSTRAINT _formation_fk_Commune FOREIGN KEY(commune_nom_formation,département_code_formation) REFERENCES _commune(commune_nom,département_code_commune);

ALTER TABLE _formation
ADD CONSTRAINT _formation_fk_Filière FOREIGN KEY(filiere_id_formation) REFERENCES _filière(filiere_id);


--Contrainte Commune 
ALTER TABLE _commune
ADD CONSTRAINT _commune_fk_Département FOREIGN KEY(département_code_commune) REFERENCES _département(département_code);


--Contraines de la table Département
ALTER TABLE _département
ADD CONSTRAINT _département_fk_Région FOREIGN KEY(region_nom_département) REFERENCES _région(region_nom);



-- Contraintes de la table Effectif_selon_mention

ALTER TABLE _effectif_selon_mention
ADD CONSTRAINT _effectif_selon_mention_fk_Session FOREIGN KEY (session_annee_effectif_selon_mention) REFERENCES _session(session_annee);

ALTER TABLE _effectif_selon_mention 
ADD CONSTRAINT _effectif_selon_mention_fk_Mention_bac FOREIGN KEY(libelle_mention_effectif_selon_mention) REFERENCES _mention_bac(libelle_mention);

ALTER TABLE _effectif_selon_mention
ADD CONSTRAINT _effectif_selon_mention_fk_Formation FOREIGN KEY(cod_aff_form_effetif_selon_mention) REFERENCES _formation(cod_aff_form);


-- Contraintes de la table Admissions_generalites

ALTER TABLE _admissions_generalites
ADD CONSTRAINT _admissions_generalites_fk_Formation FOREIGN KEY(cod_aff_form_admissions_generalites) REFERENCES _formation(cod_aff_form);

ALTER TABLE _admissions_generalites
ADD CONSTRAINT _admissions_generalites_fk_Session FOREIGN KEY(session_annee_admissions_generalites) REFERENCES _session(session_annee);
