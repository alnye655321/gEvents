DROP DATABASE IF EXISTS gevents;
CREATE DATABASE gevents;

\c gevents;

DROP TABLE IF EXISTS venues;
CREATE TABLE venues (
 ID SERIAL PRIMARY KEY,
 name VARCHAR,
 capacity INT,
 line_1 VARCHAR,
 line_2 VARCHAR,
 city VARCHAR,
 state VARCHAR,
 zip INT
);

DROP TABLE IF EXISTS events;
CREATE TABLE events (
 ID SERIAL PRIMARY KEY,
 title VARCHAR,
 description VARCHAR,
 over_21 BOOLEAN,
 venue_ID INT references venues(ID),
 start_date DATE,
 start_time TIME,
 end_time TIME
);

DROP TABLE IF EXISTS tickets;
CREATE TABLE tickets (
 ID SERIAL PRIMARY KEY,
 name VARCHAR,
 price MONEY,
 event_ID INT references events(ID)
);

DROP TABLE IF EXISTS attendees;
CREATE TABLE attendees (
 ID SERIAL PRIMARY KEY,
 first_name VARCHAR,
 last_name VARCHAR,
 birthday DATE
);

DROP TABLE IF EXISTS attendees_tickets;
CREATE TABLE attendees_tickets (
 ID SERIAL PRIMARY KEY,
 attendee_ID INTEGER references attendees(ID),
 ticket_ID INTEGER references tickets(ID)
);
