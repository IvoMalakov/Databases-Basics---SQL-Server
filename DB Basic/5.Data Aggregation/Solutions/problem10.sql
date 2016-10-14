SELECT LEFT(w.FirstName, 1) AS [first_letter]
FROM WizzardDeposits AS w
WHERE w.DepositGroup LIKE 'Troll Chest'
GROUP BY LEFT(w.FirstName, 1)
ORDER BY first_letter
