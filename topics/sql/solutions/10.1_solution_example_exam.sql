USE zli;

-- Aufgabe 1
CREATE TABLE category (
    id   INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE category_course (
    fk_category_id INT      NOT NULL,
    fk_course_id   INT      NOT NULL,
    created_at     DATETIME NOT NULL,

    FOREIGN KEY (fk_category_id) REFERENCES category (id),
    FOREIGN KEY (fk_course_id) REFERENCES course (id)
);

-- Aufgabe 2
ALTER TABLE category_course
    MODIFY created_at DATETIME NOT NULL DEFAULT NOW();


-- Aufgabe 3
INSERT INTO category (name)
VALUES ("applikationsentwicklung"),
       ("datenbanken"),
       ("management"),
       ("netzwerk");

INSERT INTO category_course (fk_category_id, fk_course_id)
VALUES (2, 2);


-- Aufgabe 4
DELETE
FROM person_course_execution
WHERE fk_participant_id = 14;
DELETE
FROM person
WHERE id = 14;


-- Aufgabe 5
UPDATE person
SET lastname = "nuesch"
WHERE firstname = "patrick"
  AND lastname = "wirz";


-- Aufgabe 6
SELECT p.firstname, p.lastname, c.name
FROM person p
         INNER JOIN person_course_execution pce ON p.id = pce.fk_participant_id
         INNER JOIN course_execution ce ON pce.fk_course_execution_id = ce.id
         INNER JOIN course c ON ce.fk_course_id = c.id
WHERE ce.room = 'Red';


-- Aufgabe 7
SELECT p.firstname AS "vorname", p.lastname AS "nachname", COUNT(pce.fk_participant_id) AS "anzahl anmeldungen"
FROM person p
         INNER JOIN person_course_execution pce ON p.id = pce.fk_participant_id
GROUP BY p.id
HAVING COUNT(pce.fk_participant_id) <= 2
ORDER BY COUNT(pce.fk_participant_id) DESC;
