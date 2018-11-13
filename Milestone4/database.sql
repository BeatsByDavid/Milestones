-- Running this script will create or RESET these tables in the database
-- WARNING: THIS SCRIPT WILL DELETE ALL EXISTING DATA
-- Running first time: Create the database you want to add the tables to
--     ie 'CREATE DATABASE beatsbydavid'
-- Running Normally: Use psql to load the sql file
--     id psql -U postgres < beatsbydavid database.sql

DROP TABLE IF EXISTS devices ; 
CREATE TABLE devices (
    ID SERIAL PRIMARY KEY,
    Location VARCHAR(50) NOT NULL,
    Status VARCHAR(20) NOT NULL,
    Temp DOUBLE PRECISION NOT NULL,
    Decibel DOUBLE PRECISION NOT NULL
);

DROP TABLE IF EXISTS locations ;
CREATE TABLE locations(
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Latitude Decimal(9,6),
    Longitude Decimal(9,6)
);

DROP TABLE IF EXISTS data ;
CREATE TABLE data (
    ID SERIAL PRIMARY KEY,
    LocationID INT REFERENCES locations(ID) NOT NULL,
    DeviceID INT REFERENCES devices(ID) NOT NULL,
    Timestamp TIMESTAMP DEFAULT NOW(),
    Type Varchar(20) NOT NULL,
    Value Decimal(10, 5) NOT NULL,
    Units Varchar (10)
);