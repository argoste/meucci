-- seems to me that here `SET AUTOCOMMIT OFF` is redoundand because I use begin, defining a block
-- is an extension ECPG


BEGIN TRANSACTION; -- equivalent to START TRANSACTION or simply BEGIN
