CREATE TABLE passengers (
    passenger_id SERIAL PRIMARY KEY,
    full_name TEXT NOT NULL,
    phone_number TEXT NOT NULL UNIQUE
);

CREATE TABLE airports (
    airport_id SERIAL PRIMARY KEY,
    airport_code CHAR(3) NOT NULL,
    country TEXT NOT NULL,
    city TEXT NOT NULL,

    UNIQUE (airport_code, country, city)
);

CREATE TABLE flights (
    flight_id SERIAL PRIMARY KEY,
    departure_airport_id INTEGER NOT NULL REFERENCES airports(airport_id) ON DELETE RESTRICT,
    arrival_airport_id INTEGER NOT NULL REFERENCES airports(airport_id) ON DELETE RESTRICT,
    departure_time TIMESTAMP NOT NULL,
    arrival_time TIMESTAMP NOT NULL,
    seats_count INTEGER NOT NULL CHECK (seats_count > 0),

    CHECK (departure_airport_id <> arrival_airport_id),
    CHECK (arrival_time > departure_time)
);

CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    passenger_id INTEGER NOT NULL REFERENCES passengers(passenger_id) ON DELETE CASCADE,
    booking_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    booking_id INTEGER NOT NULL REFERENCES bookings(booking_id) ON DELETE CASCADE,
    flight_id INTEGER NOT NULL REFERENCES flights(flight_id) ON DELETE CASCADE,
    seat INTEGER NOT NULL CHECK (seat > 0),
    price INTEGER NOT NULL CHECK (price > 0),

    UNIQUE(flight_id, seat)
);