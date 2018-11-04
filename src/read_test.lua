local sqlite3 = require("lsqlite3")
local db = sqlite3.open('test.db')
test = {}
for a in db:nrows('SELECT * FROM countries') do
  for i,v in pairs(a) do
    table.insert(test, string.format("%s => %s", i, v))
  end
end

print(table.concat(test, "\n"))
