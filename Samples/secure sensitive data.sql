USE clrdb

GO
-- The database master key is a symmetric key used to protect the private keys of certificates and asymmetric keys that are present in the database.
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'pass@word'

GO

-- Generates a symmetric key and specifies its properties.
CREATE SYMMETRIC KEY MyTestKey
WITH ALGORITHM = TRIPLE_DES
ENCRYPTION BY PASSWORD = 'pass@word'

GO

SELECT * FROM sys.symmetric_keys

GO

CREATE TABLE TestSensitive
(
  id INT IDENTITY PRIMARY KEY,
  TheValue VARBINARY(100)
)

GO

TRUNCATE TABLE TestSensitive

GO

OPEN SYMMETRIC KEY MyTestKey DECRYPTION BY PASSWORD = 'pass@word'
GO

DECLARE @keyId UNIQUEIDENTIFIER
SELECT @keyId =  key_guid FROM sys.symmetric_keys
WHERE name='MyTestKey'


INSERT INTO TestSensitive(TheValue) 
VALUES(EncryptByKey(@keyId, 'TestingThis'))

SELECT * FROM TestSensitive

SELECT CAST(DecryptByKey(TheValue) AS VARCHAR(80))
FROM TestSensitive

GO

CLOSE ALL SYMMETRIC KEYS