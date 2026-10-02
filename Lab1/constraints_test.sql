INSERT INTO passengers (
    full_name, 
    phone_number
)
VALUES 
('Duplicate Phone', '79266140229');

INSERT INTO passengers (
    full_name, 
    phone_number
)
VALUES (NULL, '79000000001');

INSERT INTO bookings (
    passenger_id, 
    booking_date
)
VALUES (9999, '2026-07-10 09:00:00');

UPDATE flights
SET seats_count = 0
WHERE flight_id = 1;

INSERT INTO tickets (
    booking_id, 
    flight_id, 
    seat, 
    price
)
VALUES (2, 1, 1, 6000);
