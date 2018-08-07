local img
function setup()
  size(320,240)
  local sqlite3 = require("lsqlite3")
  local db = sqlite3.open('world_countries.mbtiles')
  local vm = db:prepare('select tile_data from images where tile_id=37')
  while (vm:step() == sqlite3.ROW) do
    data = vm:get_uvalues()
  end
  img = importImage(data,string.len(data))
end
function draw()
  background(255)
  image(img,0,0)
end
