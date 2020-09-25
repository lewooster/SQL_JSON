SELECT TOP 1 Account.UnderwriterId, Account.ConsultantId, Account.ExternalUniqueId,Account.Name, Account.Phone, Account.Fax, Account.Email, Account.Notes, '000000' AS AgencyId, Account.ContactNumber,
Location.[ExternalUniqueId] AS [Location.ExternalUniqueId], Location.[LocationNumber] AS [Location.LocationNumber], Location.[Description] AS [Location.Description],  Location.[AdditionalInfo] AS [Location.AdditionalInfo],
Address.ProvinceId AS [Location.Address.ProvinceId],Address.AddressLine AS [Location.Address.AddressLine], Address.City AS [Location.Address.City],
Address.PostalCode AS [Location.Address.PostalCode],
Address.Longitude AS [Location.Address.Longitude],
Address.Latitude AS [Location.Address.Latitude],
Address.County AS [Location.Address.County],
MailingAddress.ProvinceId AS [MailingAddress.ProvinceId],
MailingAddress.AddressLine AS [MailingAddress.AddressLine],
MailingAddress.City AS [MailingAddress.City],
MailingAddress.PostalCode AS [MailingAddress.PostalCode],
MailingAddress.Longitude AS [MailingAddress.Longitude],
MailingAddress.Latitude AS [MailingAddress.Latitude],
MailingAddress.County AS [MailingAddress.County],
(
SELECT distinct ExtensionFields.Id,
		ExtensionFieldValue.Id AS [Value]
FROM RCT_DUCK.AccountExtensionField AS ExtensionFields
inner JOIN [RCT_DUCK].[AccountExtensionFieldValue] AS ExtensionFieldValue ON  ExtensionFields.AccountId = ExtensionFieldValue.AccountId AND ExtensionFieldValue.AccountExtensionFieldId = ExtensionFields.Id
WHERE ExtensionFields.AccountId = Account.Id
FOR JSON PATH
) AS ExtensionFields
FROM RCT_DUCK.Account AS Account
LEFT JOIN RCT_DUCK.Location AS Location ON Account.LocationId = Location.Id
LEFT JOIN RCT_DUCK.Address AS Address ON Address.Id = Location.AddressId
LEFT JOIN RCT_DUCK.MailingAddress AS MailingAddress ON MailingAddress.Id = Account.MailingAddressID
WHERE Account.Id = '159172479026741300'
--LEFT JOIN RCT_DUCK.Location AS L ON A.LocationId = L.Id
FOR JSON PATH, WITHOUT_ARRAY_WRAPPER


--- Equates To


{
   "ConsultantId":"158775495925627967",
   "ExternalUniqueId":"156437",
   "Name":"ACME Inc",
   "Phone":"1.800.454.2535",
   "Fax":"",
   "Email":"",
   "Notes":"",
   "AgencyId":"000000",
   "ContactNumber":"156437",
   "Location":{
      "ExternalUniqueId":"1591724790329986515",
      "LocationNumber":"1",
      "Description":"Client Address",
      "AdditionalInfo":"",
      "Address":{
         "ProvinceId":"22",
         "AddressLine":"5131 Bay Street",
         "City":"Flint",
         "PostalCode":"10001",
         "Longitude":"-83.6205449",
         "Latitude":"43.0125274",
         "County":""
      }
   },
   "MailingAddress":{
      "ProvinceId":"22",
      "AddressLine":"5131 Bay Street",
      "City":"Flint",
      "PostalCode":"10001",
      "Longitude":"-83.6205449",
      "Latitude":"43.0125274",
      "County":""
   },
   "ExtensionFields":{
      "Id":"11"
   }
}
