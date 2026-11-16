WITH booking_totals AS (
    SELECT b.booking_id, b.passenger_id, SUM(t.price) as total_count
    FROM bookings b
    JOIN tickets t ON t.booking_id = b.booking_id
    WHERE b.booking_status = 'completed'
    GROUP BY b.booking_id, b.passenger_id
)
SELECT p.full_name, COUNT(*), SUM(b.total_count), AVG(b.total_count)
FROM booking_totals b
JOIN passengers p ON p.passenger_id = b.passenger_id
GROUP BY p.passenger_id, p.full_name
ORDER BY SUM(b.total_count);