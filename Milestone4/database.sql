-- Running this script will create or RESET these tables in the database
-- WARNING: THIS SCRIPT WILL DELETE ALL EXISTING DATA
-- Running first time: Create the database you want to add the tables to
--     ie 'CREATE DATABASE beatsbydavid'
-- Running Normally: Use psql to load the sql file
--     ie psql -U postgres < beatsbydavid database.sql

DROP TABLE IF EXISTS data ;
DROP TABLE IF EXISTS devices ; 
DROP TABLE IF EXISTS locations ;

CREATE TABLE devices (
    ID SERIAL PRIMARY KEY,
    Location VARCHAR(50) NOT NULL,
    Status VARCHAR(20) NOT NULL,
    Temp DOUBLE PRECISION NOT NULL,
    Decibel DOUBLE PRECISION NOT NULL
);

CREATE TABLE locations(
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Latitude Decimal(9,6),
    Longitude Decimal(9,6)
);

CREATE TABLE data (
    ID SERIAL PRIMARY KEY,
    LocationID INT REFERENCES locations(ID) NOT NULL,
    DeviceID INT REFERENCES devices(ID) NOT NULL,
    Timestamp TIMESTAMP DEFAULT NOW(),
    Type Varchar(20) NOT NULL,
    Value Decimal(10, 5) NOT NULL,
    Units Varchar (10)
);

INSERT INTO Devices(Location, Status, Temp, Decibel) VALUES ('Test Location A', 'TEST A', 70, 20);
INSERT INTO Devices(Location, Status, Temp, Decibel) VALUES ('Test Location B', 'TEST B', 71, 21);
INSERT INTO Devices(Location, Status, Temp, Decibel) VALUES ('Test Location C', 'TEST C', 72, 22);

INSERT INTO Locations(Name, Latitude, Longitude) VALUES ('Test Location A', 999, 999);
INSERT INTO Locations(Name, Latitude, Longitude) VALUES ('Test Location B', 999, 999);
INSERT INTO Locations(Name, Latitude, Longitude) VALUES ('Test Location C', 999, 999);

INSERT INTO Data(LocationID, DeviceID, Timestamp, Type, Value, Units) VALUES (3, 3, TO_TIMESTAMP('2018-11-12 13:43:29', 'YYYY-MM-DD HH24:MI:SS'), 'sound', 30, 'Decibels');
INSERT INTO Data(LocationID, DeviceID, Timestamp, Type, Value, Units) VALUES (3, 3, TO_TIMESTAMP('2018-11-12 13:43:29', 'YYYY-MM-DD HH24:MI:SS'), 'temperature', 71, 'degrees F');


INSERT INTO Data (LocationID, DeviceID, Timestamp, Type, Value, Units) VALUES (1, 1, TO_TIMESTAMP('2018-11-14 14:01:15', 'YYYY-MM-DD HH24:MI:SS'), 'sound', 70, 'Decibels');
INSERT INTO Data (LocationID, DeviceID, Timestamp, Type, Value, Units) VALUES (1, 1, TO_TIMESTAMP('2018-11-14 14:01:15', 'YYYY-MM-DD HH24:MI:SS'), 'temperature', 77, 'degrees F');


INSERT INTO Data (LocationID, DeviceID, Timestamp, Type, Value, Units) VALUES (2, 2, TO_TIMESTAMP('2018-11-12 18:24:39', 'YYYY-MM-DD HH24:MI:SS'), 'sound', 7, 'Decibels');
INSERT INTO Data (LocationID, DeviceID, Timestamp, Type, Value, Units) VALUES (2, 2, TO_TIMESTAMP('2018-11-12 18:24:39', 'YYYY-MM-DD HH24:MI:SS'), 'temperature', 68, 'degrees F');


INSERT INTO Data (LocationID, DeviceID, Timestamp, Type, Value, Units) VALUES (3, 3, TO_TIMESTAMP('2018-11-15 11:37:52', 'YYYY-MM-DD HH24:MI:SS'), 'sound', 30, 'Decibels');
INSERT INTO Data (LocationID, DeviceID, Timestamp, Type, Value, Units) VALUES (3, 3, TO_TIMESTAMP('2018-11-15 11:37:52', 'YYYY-MM-DD HH24:MI:SS'), 'temperature', 72, 'degrees F');


-- INSERT INTO Data VALUES (4, 6, TO_TIMESTAMP('2018-11-16 12:03:03', 'YYYY-MM-DD HH24:MI:SS'), 'sound', 50, 'Decibels');
-- INSERT INTO Data VALUES (4, 6, TO_TIMESTAMP('2018-11-16 12:03:03', 'YYYY-MM-DD HH24:MI:SS'), 'temperature', 74, 'degrees Fahrenheit');