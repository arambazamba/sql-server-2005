CREATE TABLE test_table (col1 IPAddress)
go

INSERT INTO test_table VALUES (convert(uri, 'Instantiation String 1'))
INSERT INTO test_table VALUES (convert(uri, 'Instantiation String 2'))
INSERT INTO test_table VALUES (convert(uri, 'Instantiation String 3'))

select col1::method1() from test_table
