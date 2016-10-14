SELECT
  sel.ContinentCode,
  sel.CurrencyCode AS CurrencyCode,
  sel.CurrencyUs AS CurrencyUsage
     FROM (SELECT c.ContinentCode,
                  cr.CurrencyCode,
                  COUNT(cr.Description) AS CurrencyUs,
                  DENSE_RANK() over (partition by c.ContinentCode order by COUNT(cr.CurrencyCode) desc) as rankk
             FROM  Currencies cr
             JOIN Countries c ON cr.CurrencyCode = c.CurrencyCode
             GROUP BY c.ContinentCode, cr.CurrencyCode
             HAVING  COUNT(cr.Description) > 1) as sel
where sel.rankk = 1 
ORDER BY ContinentCode