# HOTOSMProject

How To Run:

You can just use the mbtiles that I have included in the project or follow the steps below to make your own.

If you use the ones I provide just follow the steps to run the road-diff program like this, "node index.js hawaii.mbtiles gpx.mbtiles".

Then use "tippecanoe -o hdif.mbtiles hdif.ldjson" or whatever you named your output, to convert it to mbtiles.
Then just follow the steps afterwards.

Making your own mbtiles:

First download your gpx files and download your road data from http://download.geofabrik.de/index.html. I downloaded the .shp.zip file of Hawaii. 

Make sure that the gpx and road data are for the same area.

Next unzip the shp file and convert the roads to GeoJSON. 

You will need the .shx, .shp, prj, and the dbf files. They should have the word road in them. They should look something like gis.osm_roads_free_1.shp.

Run the command ogr2ogr -f GeoJSON choose_name.json gis.osm_roads_free_1.shp.

Then we convert to mbtiles using tippecanoe. Use tippecanoe -o choose_name.mbtiles name_chosen_for_json.json.

After this convert your gpx files into mbtiles using the convert.sh file in the project. 

Just edit where the files are located and where they should be stored. I usually move them to where the ./tippecanoe executable is located.

Then, just run ./convert.sh.

After this I compared them using the road-diff program created by mourner(the linestrings branch version). 
I have included those files in my project for use.

It is possible you might have to change the lines where it says, var tiger = toLines(data.tiger.tiger2015);
  var streets = toLines(data.osm.osm);. 
  
You'll have to change the .tiger2015, and .osm at the ends to match the id of your mbtiles.

To see what the id is, run "sqlite3 name_of_tile.mbtiles". Then type "select * from metadata limit 15;" Use the first id value.

Change the values .tiger2015 and .osm with the id values of your tiles.

Run the road-diff program like, node index.js country.mbtiles gpx.mbtiles.

Then use "tippecanoe -o hdif.mbtiles hdif.ldjson" or whatever you named your output, to convert it to mbtiles.

Now you can upload the tilesets to mapbox studio and create a style. Add both of the mbtiles as layers on the map. Then publish it.

Now you can get the style id and add it to the map.html file I have in the github project, just change this line, "style: 'mapbox://styles/jsntoliver/cj1k04p4p000t2sqhftkl57dd'". 

I used notepad++ to create the html file, and was able to view it on chrome that way.

Now you can click on the map and create a point and then click again and it will create a line and tell the total distance between the points. 

This way you can see the difference between the road data and the gps data.

