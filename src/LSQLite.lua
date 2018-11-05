local sqlite3 = require("lsqlite3")

-- Embeds the 'SQLite' database engine in LuaDataFrames

function dbBegin(conn,name)
end

function dbBind(result,param)
end

function dbClearResult(result)
end

function dbCommit(conn,name)
end

function dbConnect(filename)
-- Allow you to connect to a SQLite database file
  return sqlite3.open(filename)
end

function dbDataType()
end

function dbDisconnect(conn)
end

function dbExecute(conn,query)
end

function dbHasCompleted(result)
end

function dbFetch(result,n)
-- Extract data in chunks of n rows
end

function dbGetQuery(conn,query)
-- Fetch all query results into a data frame
end

function dbGetRowsAffected(result)
end

function dbListTables(conn)
end

function dbReadTable(conn,name)
-- Returns the contents of a database table given by name as a data frame.
end

function dbRollBack(conn,name)
end

function dbSendQuery(conn,query)
end

function dbSendStatement(conn, query)
end

function dbWithTransaction()
end

function dbWriteTable(conn,name,dataframe)
-- Functions for writing data frames or delimiter-separated files to database tables.
end
