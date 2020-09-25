DECLARE @json NVARCHAR(4000)
SET @json='{"Brand":"test","Claims":[{"Claim":"1234"},{"Claim":"1234"},{"Claim":"1234"}]}';


SELECT core.*, Array.Claims
FROM OPENJSON(@json)
WITH(
Brand VARCHAR(100) '$.Brand'
) AS core
CROSS APPLY
OPENJSON(@json,'$.Claims')
WITH(
Claims VARCHAR(100) '$.Claim'
) AS Array;
