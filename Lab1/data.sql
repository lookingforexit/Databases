INSERT INTO passengers (
    full_name,
    phone_number
) 
VALUES 
('Ivanov Ivan', '79266140229'),
('Homyak Fiitov', '79140653478'),
('Vladimir Krutoi', '79518568091'),
('Biba Bobov', '79656514789'),
('Christina Ronaldova', '79654140101');

INSERT INTO airports (
    airport_code,
    country,
    city
)
VALUES
('AZH', 'Russia', 'Moscow'),
('PAM', 'Russia', 'Saint-Petersburg'),
('PIP', 'Russia', 'Chelyabinsk'),
('OFK', 'Germany', 'Berlin'),
('TYP', 'Netherlands', 'Amsterdam');

INSERT INTO flights (
    departure_airport_id,
    arrival_airport_id,
    departure_time,
    arrival_time,
    seats_count
)
VALUES
(1, 2, '2026-01-10 10:00:00', '2026-01-10 12:00:00', 2048),
(1, 3, '2026-02-10 10:00:00', '2026-02-10 14:30:00', 1024),
(1, 4, '2026-03-10 10:00:00', '2026-03-10 16:00:00', 1024),
(1, 5, '2026-04-10 10:00:00', '2026-04-10 12:00:00', 2048),
(2, 5, '2026-05-10 10:00:00', '2026-05-10 14:30:00', 1024),
(4, 5, '2026-06-10 10:00:00', '2026-06-10 16:00:00', 1024);

INSERT INTO bookings (
    passenger_id,
    booking_date
)
VALUES
(1, '2026-01-10 09:00:00'),
(2, '2026-02-10 09:00:00'),
(3, '2026-03-10 09:00:00'),
(4, '2026-04-10 09:00:00'),
(5, '2026-05-10 09:00:00');

INSERT INTO tickets (
    booking_id,
    flight_id,
    seat,
    price
)
VALUES
(1, 1, 1, 5252),
(2, 2, 1, 6666),
(3, 3, 1, 7777),
(4, 4, 1, 6767),
(5, 5, 1, 5267);