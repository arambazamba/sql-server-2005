use adventureworks
go

-- Auflisten der Tabellen einer DB
select * from sys.tables

-- Auflisten der sicherheitsPrincipals der DB
select * from sys.database_principals

-- Auflisten der aktuellen Sitzungen
select * from sys.dm_exec_sessions
where is_user_process=1

-- Noch zu schreibende IO Daten
select * from sys.dm_io_pending_io_requests

-- Aktuelle Lokcs
select * from sys.dm_tran_locks