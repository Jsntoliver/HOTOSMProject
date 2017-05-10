#!/bin/bash -ex
//change this to the directory you want to work in
WORKING_DIR=path_to_desired_dir

cd WORKING_DIR
//looks for all files that end in .gpx and changes them to .shp files
for i in $( ls path_to_files/*.gpx ); do ogr2ogr path_to_output_storage/gpx.shp -append $i tracks -fieldTypeToString DateTime; done
//converts to GeoJSON
ogr2ogr -f GeoJSON gpx.json gpx.shp
//converts to mbtiles
./tippecanoe -o gpx.mbtiles gpx.json
