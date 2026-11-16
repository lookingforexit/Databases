BEGIN;

INSERT INTO passengers (
    full_name, 
    phone_number
)
VALUES 
('Test Passenger', '79000000099');

INSERT INTO bookings (
    passenger_id, 
    booking_status
)
SELECT passenger_id, 'created'
FROM passengers
WHERE phone_number = '79000000099';

INSERT INTO tickets (
    booking_id, 
    flight_id, 
    seat, 
    price
)
SELECT b.booking_id, 12, 1, 5000
FROM bookings b
JOIN passengers p ON p.passenger_id = b.passenger_id
WHERE p.phone_number = '79000000099';

UPDATE bookings
SET booking_status = 'completed'
WHERE booking_id = 1 AND booking_status = 'created';

UPDATE bookings
SET booking_status = 'canceled'
WHERE booking_status = 'created' AND booking_date < '2026-03-01 00:00:00+03';

DELETE FROM passengers
WHERE phone_number = '79000000099';

SELECT ticket_id 
FROM tickets 
WHERE flight_id = 12;

ROLLBACK;