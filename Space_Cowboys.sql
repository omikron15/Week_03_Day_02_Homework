DROP TABLE cowboys;

CREATE TABLE cowboys(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  bounty_value INT,
  homeworld VARCHAR(255),
  Last_Known_location VARCHAR(255)
);
