-- 
-- Created by SQL::Translator::Producer::PostgreSQL
-- Created on Sat Jan 18 10:26:13 2020
-- 
;
--
-- Table: answers
--
CREATE TABLE "answers" (
  "id" serial NOT NULL,
  "ticket" integer NOT NULL,
  "question" integer NOT NULL,
  "answer" integer NOT NULL,
  "student_id" integer NOT NULL,
  "time" integer DEFAULT 0 NOT NULL,
  PRIMARY KEY ("id")
);

;
--
-- Table: students
--
CREATE TABLE "students" (
  "id" serial NOT NULL,
  "surname" text NOT NULL,
  "name" text,
  "middle_name" text,
  "age" integer,
  PRIMARY KEY ("id"),
  CONSTRAINT "students_surname" UNIQUE ("surname")
);

;
