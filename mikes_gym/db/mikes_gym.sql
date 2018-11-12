DROP TABLE bookings;
DROP TABLE members;
DROP TABLE classes;

CREATE TABLE members(
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  wallet INT4,
  member_type VARCHAR(255)
);

CREATE TABLE classes(
  id SERIAL8 primary key,
  class_name VARCHAR(255),
  class_tier VARCHAR(255),
  class_capacity INT4
);

CREATE TABLE bookings(
  id SERIAL8 primary key,
  member_id INT8 REFERENCES members(id) ON DELETE CASCADE,
  class_id INT8 REFERENCES classes(id) ON DELETE CASCADE
);
