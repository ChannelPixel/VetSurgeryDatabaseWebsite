SELECT bookingId, petName, email
FROM VetSurgery.dbo.booking JOIN pet ON booking.petID=pet.petId
WHERE email LIKE '%al%@vetsurgery.com'
AND petName LIKE '%a%';