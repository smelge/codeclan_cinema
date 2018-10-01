DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS screenings;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS films;

CREATE TABLE customers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  funds INT8
);

CREATE TABLE films (
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  price INT2
);

CREATE TABLE tickets (
  id SERIAL8 PRIMARY KEY,
  customer_id INT2 REFERENCES customers(id) ON DELETE CASCADE,
  film_id INT2 REFERENCES films(id) ON DELETE CASCADE,
  showing INT2 REFERENCES screenings(id) ON DELETE CASCADE
);

CREATE TABLE screenings (
  id SERIAL8 PRIMARY KEY,
  film_id INT2 REFERENCES films(id) ON DELETE CASCADE,
  screening VARCHAR(4),
  ticket_no INT2
)
