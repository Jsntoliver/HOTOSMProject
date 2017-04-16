#!/bin/bash -ex

WORKING_DIR=path_to_desired_dir

cd WORKING_DIR

for i in $( ls path_to_files/*.gpx ); do ogr2ogr path_to_output_storage/gpx.shp -append $i tracks -fieldTypeToString DateTime; done

ogr2ogr -f GeoJSON gpx.json gpx.shp

./tippecanoe -o gpx.mbtiles gpx.json
