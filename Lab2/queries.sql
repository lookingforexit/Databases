SELECT t.ticket_id, p.full_name, b.booking_status, d.city
FROM tickets t
JOIN bookings b ON b.booking_id = t.booking_id
JOIN passengers p ON p.passenger_id = b.passenger_id
JOIN flights f ON f.flight_id = t.flight_id
JOIN airports d ON d.airport_id = f.departure_airport_id
JOIN airports a ON a.airport_id = f.arrival_airport_id
ORDER BY t.ticket_id;

SELECT f.flight_id, a.city
FROM flights f
JOIN airports a ON a.airport_id = f.departure_airport_id
LEFT JOIN tickets t ON t.flight_id = f.flight_id
WHERE t.ticket_id IS NULL
ORDER BY f.flight_id;

SELECT DISTINCT p.passenger_id, p.full_name
FROM passengers p
JOIN bookings b ON b.passenger_id = p.passenger_id
JOIN tickets t ON t.booking_id = b.booking_id
JOIN flights f ON f.flight_id = t.flight_id
JOIN airports departure ON departure.airport_id = f.departure_airport_id
JOIN airports arrival ON arrival.airport_id = f.arrival_airport_id
WHERE b.booking_status = 'completed'
AND t.price >= 8000
AND departure.country <> arrival.country
AND f.departure_time >= '2026-03-01 00:00:00+03'
AND f.departure_time < '2026-04-01 00:00:00+03'
ORDER BY p.passenger_id;

SELECT p.passenger_id, p.full_name, COUNT(b.booking_id)
FROM passengers p
LEFT JOIN bookings b ON b.passenger_id = p.passenger_id
GROUP BY p.passenger_id, p.full_name
ORDER BY COUNT(b.booking_id), p.passenger_id;

SELECT f.flight_id, SUM(t.price)
FROM flights f
JOIN tickets t ON t.flight_id = f.flight_id
JOIN bookings b ON b.booking_id = t.booking_id
WHERE b.booking_status = 'completed'
GROUP BY f.flight_id
HAVING SUM(t.price) > 20000
ORDER BY SUM(t.price), f.flight_id;

SELECT b.booking_status, COUNT(t.ticket_id), SUM(t.price), AVG(t.price)
FROM bookings b
JOIN tickets t ON t.booking_id = b.booking_id
GROUP BY b.booking_status
ORDER BY b.booking_status;

SELECT t.ticket_id, t.flight_id, t.price
FROM tickets t
JOIN bookings b ON b.booking_id = t.booking_id
WHERE b.booking_status = 'completed'
AND t.price > (
    SELECT AVG(other.price)
    FROM tickets other
    JOIN bookings other_booking ON other_booking.booking_id = other.booking_id
    WHERE other.flight_id = t.flight_id AND other_booking.booking_status = 'completed'
)
ORDER BY t.flight_id, t.ticket_id;

SELECT p.passenger_id, p.full_name
FROM passengers p
WHERE EXISTS (
    SELECT 1
    FROM bookings b
    WHERE b.passenger_id = p.passenger_id AND b.booking_status = 'canceled'
)
ORDER BY p.passenger_id;

SELECT p.passenger_id, p.full_name
FROM passengers p
WHERE NOT EXISTS (
    SELECT 1
    FROM bookings b
    WHERE b.passenger_id = p.passenger_id AND b.booking_status = 'completed'
)
ORDER BY p.passenger_id;

SELECT p.passenger_id, p.full_name, (
    SELECT SUM(t.price)
    FROM bookings b
    JOIN tickets t ON t.booking_id = b.booking_id
    WHERE b.passenger_id = p.passenger_id
    AND b.booking_status = 'completed'
) AS total_count
FROM passengers p
ORDER BY total_count, p.passenger_id;