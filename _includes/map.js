require([
  "esri/Map",
  "esri/views/MapView",
  "esri/layers/TileLayer"
], function (Map, MapView, TileLayer) {

  var layer = new TileLayer({
    url: "http://www.coast.noaa.gov/arcgis/rest/services/dc_slr/slr_9ft/MapServer",
  });

  var map = new Map({
    basemap: "gray",
    layers: [layer]
  });

  var view = new MapView({
    container: "myMap",
    map: map,
    center: [-123, 44],
    zoom: 13
  });
});
