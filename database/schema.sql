set client_min_messages to warning;

-- DANGER: this is NOT how to do it in the real world.
-- `drop schema` INSTANTLY ERASES EVERYTHING.
drop schema "public" cascade;

create schema "public";

CREATE TABLE "public"."resorts" (
	"resortId" integer NOT NULL UNIQUE,
	"address" integer NOT NULL UNIQUE,
	"latitude" integer NOT NULL UNIQUE,
	"longitude" integer NOT NULL UNIQUE
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public"."trips" (
	"resortId" integer NOT NULL,
	"start-date" integer NOT NULL UNIQUE,
	"end-date" integer NOT NULL UNIQUE,
	"Imageid" integer NOT NULL UNIQUE,
	"trip-name" integer NOT NULL UNIQUE
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public"."checklistItems" (
	"resortId" integer NOT NULL,
	"itemid" integer NOT NULL UNIQUE,
	"isPacked" BOOLEAN NOT NULL UNIQUE
) WITH (
  OIDS=FALSE
);




ALTER TABLE "trips" ADD CONSTRAINT "trips_fk0" FOREIGN KEY ("resortId") REFERENCES "resorts"("resortId");

ALTER TABLE "checklistItems" ADD CONSTRAINT "checklistItems_fk0" FOREIGN KEY ("resortId") REFERENCES "resorts"("resortId");
