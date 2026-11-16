CREATE TABLE flight_changes (
    flight_change_id SERIAL PRIMARY KEY,
    flight_id INT NOT NULL REFERENCES flights(flight_id) ON DELETE RESTRICT,
    old_departure_airport_id INT NOT NULL REFERENCES airports(airport_id) ON DELETE RESTRICT,
    new_departure_airport_id INT NOT NULL REFERENCES airports(airport_id) ON DELETE RESTRICT,
    old_departure_time TIMESTAMPTZ NOT NULL,
    new_departure_time TIMESTAMPTZ NOT NULL,
    old_arrival_time TIMESTAMPTZ NOT NULL,
    new_arrival_time TIMESTAMPTZ NOT NULL,
    changed_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CHECK(old_departure_airport_id <> new_departure_airport_id),
    CHECK(old_departure_time < new_departure_time),
    CHECK(old_arrival_time < new_arrival_time)
);