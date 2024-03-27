
-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/k3JHtI
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here

-- Drop the table if it exists before
DROP TABLE if exists contacts;
DROP TABLE if exists campaign;
DROP TABLE if exists category;
DROP TABLE if exists subcategory;

-- Modify the database to set datestyle to MM-DD-YYYY Format
ALTER DATABASE "crowdfunding_db" SET datestyle TO "ISO, MDY";

-- Create Table contacts
CREATE TABLE "contacts" (
    "contact_id" INTEGER   NOT NULL,
    "first_name" VARCHAR(50)   NOT NULL,
    "last_name" VARCHAR(50)   NOT NULL,
    "email" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);

-- Create Table campaign
CREATE TABLE "campaign" (
    "cf_id" INTEGER   NOT NULL,
    "contact_id" INTEGER   NOT NULL,
    "company_name" VARCHAR(100)   NOT NULL,
    "description" VARCHAR(255)   NOT NULL,
    "goal" FLOAT   NOT NULL,
    "pledged" FLOAT   NOT NULL,
    "outcome" VARCHAR(50)   NOT NULL,
    "backers_count" INTEGER   NOT NULL,
    "country" VARCHAR(10)   NOT NULL,
    "currency" VARCHAR(5)   NOT NULL,
    "launch_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL,
    "category_id" VARCHAR(10)   NOT NULL,
    "subcategory_id" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);

-- Create Table category
CREATE TABLE "category" (
    "category_id" VARCHAR(10)   NOT NULL,
    "category_name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

-- Create Table subcategory
CREATE TABLE "subcategory" (
    "subcategory_id" VARCHAR(10)   NOT NULL,
    "subcategory_name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

-- Add contact_id Foreign key for campaign Table referencing contact table
ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

-- Add category_id Foreign key for campaign Table referencing category table
ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

-- Add subcategory_id Foreign key for campaign Table referencing subcategory table
ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");


--select the data from all the tables
select * from contacts;
select * from category;
select * from subcategory;
select * from campaign;