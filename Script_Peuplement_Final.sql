-- Populate parcoursup2


-- TABLE temporaire
drop schema IF EXISTS "parcoursup2" CASCADE;
create schema "parcoursup2";
set schema 'parcoursup2';

create table import_data(
  session_annee                                                                   numeric(4)    not null,
  etablissement_statut                                                            varchar(40)   not null,
  etablissement_code_uai                                                          varchar(10)   not null, 
  etablissement_nom                                                               varchar(150)  not null,
  departement_code                                                                varchar(3)    not null,
  departement_nom                                                                 varchar(50)   not null, 
  region_nom                                                                      varchar(50)   not null, 
  academie_nom                                                                    varchar(50)   not null, 
  commune_nom                                                                     varchar(50)   not null,
  filiere_libelle                                                                 varchar(400)  not null, 
  selectivite                                                                     varchar(30)   not null, 
  filiere_libelle_tres_abrege                                                     varchar(30)   not null, 
  filiere_libelle_detaille                                                        varchar(400)  not null, 
  filiere_libelle_abrege                                                          varchar(100)  not null,
  filiere_libelle_detaille_bis                                                    varchar(150)  not null,
  filiere_libelle_tres_detaille                                                   varchar(400), -- peut être vide
  coordonnees_gps                                                                 varchar(30)   not null, 
  capacite                                                                        integer       not null, 
  effectif_total_candidats                                                        integer       not null, 
  effectif_total_candidates                                                       integer       not null,
  effectif_candidat_neo_bac_classes_type_general                                  integer       not null, 
  effectif_candidat_neo_bac_classes_type_techno                                   integer       not null, 
  effectif_candidat_neo_bac_classes_type_pro                                      integer       not null,  
  effectif_candidat_classes_type_autres                                           integer       not null,
  effectif_admis_neo_bac_type_general                                             integer       not null, -- effectif_admis_neo_bac type_bac = general
  effectif_admis_neo_bac_type_techno                                              integer       not null, -- effectif_admis_neo_bac type_bac = techno
  effectif_admis_neo_bac_type_pro                                                 integer       not null, -- effectif_admis_neo_bac type_bac = pro
  effectif_admis_neo_bac_type_autres                                              integer       not null, -- effectif_admis_neo_bac type_bac = autres
  effectif_admis_neo_bac_selon_mention_type_mention_sans_info                     integer       not null,
  effectif_admis_neo_bac_selon_mention_type_mention_sans_mention                  integer       not null,
  effectif_admis_neo_bac_selon_mention_type_mention_assez_bien                    integer       not null,
  effectif_admis_neo_bac_selon_mention_type_mention_bien                          integer       not null,
  effectif_admis_neo_bac_selon_mention_type_mention_tres_bien                     integer       not null,
  effectif_admis_neo_bac_selon_mention_type_mention_tres_bien_fel                 integer       not null,
  effectif_admis_neo_bac_avec_mention_type_bac_general                            integer       not null,
  effectif_admis_neo_bac_avec_mention_type_bac_techno                             integer       not null,
  effectif_admis_neo_bac_avec_mention_type_bac_pro                                integer       not null,
  regroupement_1                                                                  varchar(100), 
  rang_dernier_appele_groupe1                                                     integer,
  regroupement_2                                                                  varchar(100), 
  rang_dernier_appele_groupe2                                                     integer,
  regroupement_3                                                                  varchar(100), 
  rang_dernier_appele_groupe3                                                     integer,
  list_com                                                                        varchar(60)   not null, 
  tri                                                                             varchar(20)   not null, 
  cod_aff_form                                                                    varchar(20)   not null,
  concours_communs_banques_epreuves                                               varchar(100),
  url_formation                                                                   varchar(150)
);

-- IMPORT de toutes les données utilisées
WbImport -file=./fr-esr-parcoursup_2022.csv
         -header=true
         -delimiter=';'
         -quoteChar='"' 
         -table=import_data
         -schema=parcoursup2
         -mode=insert
         -filecolumns=session_annee, etablissement_statut, etablissement_code_uai, etablissement_nom,
                      departement_code, departement_nom, region_nom, academie_nom, commune_nom,
                      filiere_libelle, selectivite, filiere_libelle_tres_abrege, filiere_libelle_detaille, 
                      filiere_libelle_abrege, filiere_libelle_detaille_bis, filiere_libelle_tres_detaille, 
                      coordonnees_gps, capacite, effectif_total_candidats, effectif_total_candidates, 
                      effectif_total_phase_principale, effectif_internat_phase_principale, 
                      effectif_neo_bac_general_phase_principale, effectif_neo_bac_general_phase_principale_boursier,
                      effectif_neo_bac_techno_phase_principale, effectif_neo_bac_techno_principale_boursier, 
                      effectif_neo_bac_pro_phase_principale, effectif_neo_bac_pro_phase_principale_boursier,
                      effectif_total_autres_phase_principale, effectif_total_phase_complementaire,
                      effectif_neo_bac_general_phase_complementaire, effectif_neo_bac_techno_phase_complementaire,
                      effectif_neo_bac_pro_phase_complementaire, effectif_total_autres_phase_complementaire,
                      effectif_total_classes_phase_principale, effectif_total_classes_phase_complementaire,
                      effectif_total_classes_internat_cpge, effectif_total_classes_hors_internat_cpge,
                      effectif_candidat_neo_bac_classes_type_general, 
                      effectif_candidat_neo_bac_boursiers_classes_type_general,
                      effectif_candidat_neo_bac_classes_type_techno, 
                      effectif_candidat_neo_bac_boursiers_classes_type_techno,
                      effectif_candidat_neo_bac_classes_type_pro, 
                      effectif_candidat_neo_bac_boursiers_classes_type_pro, effectif_candidat_classes_type_autres,
                      effectif_total_proposition_admission, effectif_total_admis, effectif_total_admises,
                      effectif_total_admis_phase_principale, effectif_total_admis_phase_complementaire,
                      effectif_proposition_admis_ouverture_procedure_principale, effectif_proposition_admis_avant_bac,
                      effectif_proposition_admis_avant_fin_procedure_principale, effectif_admis_en_internat, 
                      effectif_total_admis_boursiers_neo_bac, effectif_total_admis_neo_bac, 
                      effectif_admis_neo_bac_type_general, effectif_admis_neo_bac_type_techno,
                      effectif_admis_neo_bac_type_pro, effectif_admis_neo_bac_type_autres,
                      effectif_admis_neo_bac_selon_mention_type_mention_sans_info,
                      effectif_admis_neo_bac_selon_mention_type_mention_sans_mention,
                      effectif_admis_neo_bac_selon_mention_type_mention_assez_bien,
                      effectif_admis_neo_bac_selon_mention_type_mention_bien,
                      effectif_admis_neo_bac_selon_mention_type_mention_tres_bien,
                      effectif_admis_neo_bac_selon_mention_type_mention_tres_bien_fel,
                      effectif_admis_neo_bac_avec_mention_type_bac_general,
                      effectif_admis_neo_bac_avec_mention_type_bac_techno,
                      effectif_admis_neo_bac_avec_mention_type_bac_pro,
                      effectif_admis_meme_etablissement, effectif_admises_meme_etablissement,
                      effectif_admis_meme_academie, effectif_admis_meme_academis_pcv,
                      pourcent_proposition_admis_ouverture_procedure_principale, pourcent_proposition_avant_bac,
                      pourcent_proposition_admis_avant_fin_procedure_principale, pourcent_admises,
                      pourcent_neo_bac_admis_meme_academie, pourcent_neo_bac_admis_meme_academie_pcv,
                      pourcent_neo_bac_admis_meme_etablissement_bts_cpge, pourcent_neo_bac_admis_boursiers,
                      pourcent_neo_bac, pourcent_neo_bac_mention_sans_info, pourcent_neo_bac_mention_sans,
                      pourcent_neo_bac_mention_assez_bien, pourcent_neo_bac_mention_bien, 
                      pourcent_neo_bac_mention_très_bien, pourcent_neo_bac_mention_très_bien_felicitations,
                      pourcent_neo_bac_general, pourcent_neo_bac_general_avec_mention, pourcent_neo_bac_techno, 
                      pourcent_neo_bac_techno_avec_mention, pourcent_neo_bac_pro, pourcent_neo_bac_pro_avec_mention,
                      effectif_candidats_terminale_generale_avec_proposition_admis,
                      effectif_candidats_terminale_generale_boursiers_avec_proposition_admis,
                      effectif_candidats_terminale_techno_avec_proposition_admis,
                      effectif_candidats_terminale_techno_boursiers_avec_proposition_admis,
                      effectif_candidats_terminale_pro_avec_proposition_admis,
                      effectif_candidats_terminale_pro_boursiers_avec_proposition_admis,
                      effectif_autres_candidats_avec_proposition_admis, regroupement_1, rang_dernier_appele_groupe1,
                      regroupement_2, rang_dernier_appele_groupe2, regroupement_3, rang_dernier_appele_groupe3,
                      list_com, tri, cod_aff_form, concours_communs_banques_epreuves, url_formation, taux_acces,
                      part_terminale_generale_en_position_admis_phase_principale, 
                      part_terminale_techno_en_position_admis_phase_principale,
                      part_terminale_pro_en_position_admis_phase_principale,
                      etablissement_id_paysage, composante_id_paysage
         -importColumns=session_annee, etablissement_statut, etablissement_code_uai, etablissement_nom,
                      departement_code, departement_nom, region_nom, academie_nom, commune_nom, filiere_libelle, 
                      selectivite, filiere_libelle_tres_abrege, filiere_libelle_detaille, filiere_libelle_abrege,
                      filiere_libelle_detaille_bis, filiere_libelle_tres_detaille, coordonnees_gps, capacite, 
                      effectif_total_candidats, effectif_total_candidates, 
                      effectif_candidat_neo_bac_classes_type_general, 
                      effectif_candidat_neo_bac_classes_type_techno, 
                      effectif_candidat_neo_bac_classes_type_pro, 
                      effectif_candidat_classes_type_autres,
                      effectif_admis_neo_bac_type_general, effectif_admis_neo_bac_type_techno,
                      effectif_admis_neo_bac_type_pro, effectif_admis_neo_bac_type_autres,
                      effectif_admis_neo_bac_selon_mention_type_mention_sans_info,
                      effectif_admis_neo_bac_selon_mention_type_mention_sans_mention,
                      effectif_admis_neo_bac_selon_mention_type_mention_assez_bien,
                      effectif_admis_neo_bac_selon_mention_type_mention_bien,
                      effectif_admis_neo_bac_selon_mention_type_mention_tres_bien,
                      effectif_admis_neo_bac_selon_mention_type_mention_tres_bien_fel,
                      effectif_admis_neo_bac_avec_mention_type_bac_general,
                      effectif_admis_neo_bac_avec_mention_type_bac_techno,
                      effectif_admis_neo_bac_avec_mention_type_bac_pro,
                      regroupement_1, rang_dernier_appele_groupe1, regroupement_2, rang_dernier_appele_groupe2,
                      regroupement_3, rang_dernier_appele_groupe3,
                      list_com, tri, cod_aff_form, concours_communs_banques_epreuves, url_formation;
--         -keyColumns=etablissement_code_UAI;


create table _academie(
    academie_nom  varchar(50),
    constraint _academie_pk primary key(academie_nom)
);

create table _region(
    region_nom  varchar(50),
    constraint _region_pk primary key(region_nom)
);

create table _departement(
    departement_code    varchar(3),
    departement_nom     varchar(50) not null,
    region_nom          varchar(50) not null,
    constraint _departement_pk primary key(departement_code),
    constraint _departemnent_fk_region foreign key (region_nom)
        references _region(region_nom)
);

create table _commune(
    commune_nom         varchar(50),
    departement_code    varchar(3),
    constraint _commune_pk primary key (commune_nom, departement_code),
    constraint _commune_fk_departement foreign key (departement_code)
        references _departement(departement_code) 
);

create table _etablissement(
    etablissement_code_uai  varchar(10),
    etablissement_nom       varchar(150) not null,
    etablissement_statut    varchar(40) not null,
    constraint _etablissement_pk primary key (etablissement_code_uai)
);

create table _filiere(
    filiere_id                      serial,
    filiere_libelle                 varchar(400)    not null,
    filiere_libelle_tres_abrege     varchar(30)     not null,
    filiere_libelle_abrege          varchar(100)    not null,
    filiere_libelle_detaille_bis    varchar(150)    not null,
--    filiere_libelle_tres_detaille   varchar(400), -- possiblement vide
    constraint _filiere_pk primary key (filiere_id)
);

create table _formation (
    filiere_libelle_detaille          varchar(400)    not null, -- toutes les infos, y compris l'établissement
    coordonnees_gps                   varchar(30)     not null,
    list_com                          varchar(60),    -- possiblement vide
    cod_aff_form                      varchar(20)     not null, -- identifiant pour une année
    tri                               varchar(20)     not null,
    concours_communs_banques_epreuves varchar(100),   -- possiblement vide
    url_formation                     varchar(150),   -- possiblement vide
    filiere_id                        integer         not null,
    etablissement_code_uai            varchar(15)     not null,
    commune_nom                       varchar(50)     not null,
    departement_code                  varchar(3)      not null,
    academie_nom                      varchar(50)     not null,
    constraint _formation_pk primary key (cod_aff_form),
    constraint _formation_fk_filiere foreign key (filiere_id)
        references _filiere(filiere_id),
    constraint _formation_fk_etablissement foreign key (etablissement_code_uai)
        references _etablissement(etablissement_code_uai),
    constraint _formation_fk_commune foreign key(commune_nom, departement_code)
        references _commune(commune_nom, departement_code),
    constraint _formation_fk_academie foreign key(academie_nom)
        references _academie(academie_nom)
);

create table _session(
    session_annee   numeric(4), -- sensible au bug de l'an 10000
    constraint _session_pk primary key (session_annee)
);

create table _mention_bac(
    libelle_mention     varchar(40),
    constraint _mention_pk primary key (libelle_mention)
);

create table _type_bac(
    type_bac    varchar(20),
    constraint _type_bac_pk primary key (type_bac)
);

create table _regroupement(
    libelle_regroupement    varchar(100),
    constraint _regroupement_pk primary key(libelle_regroupement)
);

create table _admissions_generalites(
    cod_aff_form                            varchar(20),
    session_annee                           numeric(4),
    selectivite                             varchar(30)     not null,
    capacite                                integer         not null,
    effectif_total_candidats                integer         not null, -- candidates incluses
    effectif_total_candidates               integer         not null,
    constraint _admissions_generalites_pk
        primary key(cod_aff_form,session_annee),
    constraint _admissions_generalites_fk_formation
        foreign key (cod_aff_form) references _formation(cod_aff_form),
    constraint _admissions_generalites_fk_session
        foreign key (session_annee) references _session(session_annee),
    constraint _admissions_generalite_ck_candidats_candidates
        check (effectif_total_candidats >= effectif_total_candidates)
);

create table _admissions_selon_type_neo_bac(
    cod_aff_form                                    varchar(20),
    session_annee                                   numeric(4),
    type_bac                                        varchar(20),
    effectif_candidat_neo_bac_classes               integer     not null,
    constraint _admissions_selon_type_neo_bac_pk 
        primary key (cod_aff_form, session_annee, type_bac),
    constraint _admissions_selon_type_neo_bac_fk_formation
        foreign key (cod_aff_form) references _formation(cod_aff_form),
    constraint _admissions_selon_type_neo_bac_fk_session
        foreign key (session_annee) references _session(session_annee),
    constraint _admissions_selon_type_neo_bac_fk_type_bac
        foreign key (type_bac) references _type_bac(type_bac)
);

create table _effectif_selon_mention(
    cod_aff_form                            varchar(20),
    session_annee                           numeric(4),
    libelle_mention                         varchar(40),
    effectif_admis_neo_bac_selon_mention    integer,
    constraint _effectif_selon_mention_pk 
        primary key (cod_aff_form, session_annee, libelle_mention),
    constraint _effectif_selon_mention_fk_formation
        foreign key (cod_aff_form) references _formation(cod_aff_form),
    constraint _effectif_selon_mention_fk_session
        foreign key(session_annee) references _session(session_annee),
    constraint _effectif_selon_mention_fk_mention_bac
        foreign key(libelle_mention) references _mention_bac(libelle_mention)
);

create table _rang_dernier_appele_selon_regroupement(
    cod_aff_form                        varchar(20),
    session_annee                       numeric(4),
    libelle_regroupement                varchar(100),
    rang_dernier_appele                 integer,
    constraint _rang_dernier_appele_selon_regroupement_pk
        primary key (cod_aff_form, session_annee, libelle_regroupement),
    constraint _rang_dernier_appele_selon_regroupement_fk_formation
        foreign key (cod_aff_form) references _formation(cod_aff_form),
    constraint _rang_dernier_appele_selon_regroupement_fk_session
        foreign key (session_annee) references _session(session_annee),
    constraint _rang_dernier_appele_selon_regroupement_fk_regroupement
        foreign key (libelle_regroupement) references _regroupement(libelle_regroupement)
);

commit; -- utile si oubli de l'autocommit dans la configuration



-- PEUPLEMENT DES TABLES


-- Insertion de Session

INSERT INTO _session (session_annee)
SELECT distinct session_annee
FROM import_data;


-- Insertion de mention_abc

INSERT INTO _mention_bac (libelle_mention)
VALUES ('Très bien félicitation'), ('Très bien'), ('Sans mention'), ('Sans info'), ('Bien'), ('Assez bien');


-- Insertion de filière

INSERT INTO _filiere (filiere_libelle, filiere_libelle_tres_abrege,filiere_libelle_abrege, filiere_libelle_detaille_bis)
SELECT DISTINCT filiere_libelle, filiere_libelle_tres_abrege,filiere_libelle_abrege, filiere_libelle_detaille_bis from import_data;

-- Insertion de type_bac
INSERT INTO _type_bac (type_bac)
VALUES ('Generale'),('Technologique'),('Professionnel'), ('Autre');


-- Insertion de la table _region

Insert into _region(region_nom) select distinct region_nom from import_data;

-- Insertion _département

Insert into _departement(departement_code,departement_nom,region_nom) select distinct departement_code,departement_nom,region_nom from import_data;

-- Insertion Commune

Insert into _commune(commune_nom,departement_code) select distinct commune_nom,departement_code from import_data;

-- Insertion Académie 

Insert into _academie(academie_nom) select distinct academie_nom from import_data;


-- Insertion etablissement

Insert into _etablissement(etablissement_code_uai,etablissement_nom,etablissement_statut) select distinct etablissement_code_uai,etablissement_nom,etablissement_statut from import_data;


-- Insertion formation

INSERT INTO _formation (filiere_libelle_detaille, coordonnees_gps, list_com, cod_aff_form, tri, concours_communs_banques_epreuves, url_formation, filiere_id, etablissement_code_uai, commune_nom, departement_code, academie_nom)
SELECT DISTINCT filiere_libelle_detaille, coordonnees_gps, list_com, cod_aff_form, tri, concours_communs_banques_epreuves, url_formation, filiere_id, etablissement_code_uai, commune_nom, departement_code, academie_nom FROM import_data NATURAL JOIN _filiere;


-- Insertion _regroupement

Insert into _regroupement(libelle_regroupement) select regroupement_1 from import_data where regroupement_1 IS NOT NULL union select regroupement_2 from import_data where regroupement_2 IS NOT NULL union select regroupement_3 from import_data where regroupement_3 IS NOT NULL;


-- Insertion _Admissions_generalites

Insert into _admissions_generalites
select distinct cod_aff_form, session_annee, selectivite, capacite, effectif_total_candidats, effectif_total_candidates from import_data;


--Insertion _admissions_selon_type_neo_bac --

INSERT INTO _admissions_selon_type_neo_bac (cod_aff_form, session_annee, type_bac, effectif_candidat_neo_bac_classes)
SELECT DISTINCT cod_aff_form, session_annee, type_bac, effectif_admis_neo_bac_type_general FROM import_data
natural join _type_bac
where type_bac = 'Generale';

INSERT INTO _admissions_selon_type_neo_bac (cod_aff_form, session_annee, type_bac, effectif_candidat_neo_bac_classes)
SELECT DISTINCT cod_aff_form, session_annee, type_bac, effectif_candidat_neo_bac_classes_type_techno FROM import_data
natural join _type_bac
where type_bac = 'Technologique';

INSERT INTO _admissions_selon_type_neo_bac (cod_aff_form, session_annee, type_bac, effectif_candidat_neo_bac_classes)
SELECT DISTINCT cod_aff_form, session_annee, type_bac, effectif_candidat_neo_bac_classes_type_pro FROM import_data
natural join _type_bac
where type_bac = 'Professionnel';

INSERT INTO _admissions_selon_type_neo_bac (cod_aff_form, session_annee, type_bac, effectif_candidat_neo_bac_classes)
SELECT DISTINCT cod_aff_form, session_annee, type_bac, effectif_candidat_classes_type_autres FROM import_data
natural join _type_bac
where type_bac = 'Autre';


-- Insertion _effectif_selon_mention

Insert into _effectif_selon_mention select distinct cod_aff_form,session_annee,_mention_bac.
libelle_mention,effectif_admis_neo_bac_selon_mention_type_mention_sans_info
from import_data natural join _mention_bac where libelle_mention ='Sans info';

Insert into _effectif_selon_mention select distinct cod_aff_form,session_annee,_mention_bac.
libelle_mention,effectif_admis_neo_bac_selon_mention_type_mention_sans_mention
from import_data natural join _mention_bac where libelle_mention ='Sans mention';

Insert into _effectif_selon_mention select distinct cod_aff_form,session_annee,_mention_bac.
libelle_mention,effectif_admis_neo_bac_selon_mention_type_mention_assez_bien
from import_data natural join _mention_bac where libelle_mention ='Assez bien';

Insert into _effectif_selon_mention select distinct cod_aff_form,session_annee,_mention_bac.
libelle_mention,effectif_admis_neo_bac_selon_mention_type_mention_bien
from import_data natural join _mention_bac where libelle_mention ='Bien';

Insert into _effectif_selon_mention select distinct cod_aff_form,session_annee,_mention_bac.
libelle_mention,effectif_admis_neo_bac_selon_mention_type_mention_tres_bien
from import_data natural join _mention_bac where libelle_mention ='Très bien';

Insert into _effectif_selon_mention select distinct cod_aff_form,session_annee,_mention_bac.
libelle_mention,effectif_admis_neo_bac_selon_mention_type_mention_tres_bien_fel
from import_data natural join _mention_bac where libelle_mention ='Très bien félicitation';

-- Insertion _rang_dernier_appele_selon_regroupement
INSERT INTO _rang_dernier_appele_selon_regroupement (cod_aff_form,session_annee,libelle_regroupement,rang_dernier_appele)
SELECT distinct cod_aff_form,session_annee,regroupement_1,rang_dernier_appele_groupe1 from import_data WHERE rang_dernier_appele_groupe1 IS NOT NULL
union
SELECT distinct cod_aff_form,session_annee,regroupement_2,rang_dernier_appele_groupe2 from import_data WHERE rang_dernier_appele_groupe2 IS NOT NULL
union
SELECT distinct cod_aff_form,session_annee,regroupement_3,rang_dernier_appele_groupe3 from import_data WHERE rang_dernier_appele_groupe3 IS NOT NULL