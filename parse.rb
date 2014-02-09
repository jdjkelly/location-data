require 'JSON'
require 'oj'

data = Oj.load( IO.read('LocationHistory.json') )

begin
  file = File.open("data.js", "w")
  file.write("var locationData = [")

  data["locations"].each do |location|
    lat = location["latitudeE7"].to_f / 10000000
    lng = location["longitudeE7"].to_f / 10000000
    file.write("\n [#{lat}, #{lng}],")
  end
rescue IOError => e
  #some error occur, dir not writable etc.
ensure
  file.write("]")
  file.close unless file == nil
end




