<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>{{record["name"]}}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/leaflet.min.css"
    integrity="sha512-h9FcoyWjHcOcmEVkxOfTLnmZFWIH0iZhZT1H2TbOq55xssQGEJHEaIm+PgoUaZbRvQTNTluNOEfb1ZRy6D3BOw=="
    crossorigin="anonymous"
    referrerpolicy="no-referrer"
  />
  <style>
    body { font-family: system-ui, -apple-system, Segoe UI, Roboto, Arial, sans-serif; margin: 2rem; }
    .card { border: 1px solid #e5e7eb; border-radius: 10px; padding: 1rem; }
    .meta { color: #6b7280; font-size: 0.95rem; }
    a { text-decoration: none; color: #2563eb; }
    a:hover { text-decoration: underline; }
    #map { height: 480px; }
  </style>
</head>
<body>
  <p><a id="id_search" href="/">&larr; Back to search</a></p>

  <div id="id_div_record_detail" class="card">
  % if record:
    <h1 style="margin: 0.2rem 0 0.6rem;">{{record["name"]}}</h1>
    <p>{{record["description"]}}</p>
    <p><img src="/static/{{record["filename"]}}"></p>
    <div id="map" class="map"></div>
  % else:
    <h1>Record not found</h1>
    <p>I couldn't find a record with ID <strong>{{record_id}}</strong>.</p>
  % end
  </div>

  <script
    src="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/leaflet.js"
    integrity="sha512-BwHfrr4c9kmRkLw6iXFdzcdWV/PGkVgiIyIWLLlTSXzWQzxuSg4DiQUCpauz/EWjgk5TYQqX/kvn9pG1NpYfqg=="
    crossorigin="anonymous"
    referrerpolicy="no-referrer"
  ></script>
  <script>
    const openStreetMap = L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png");
    const geojsonFeature = {
    "type": "Feature",
    "geometry": {
        "type": "Point",
        "coordinates": [{{record["longitude"]}}, {{record["latitude"]}}]
    },
    "properties": {
        "name": "{{record['name']}}",
        "description": "{{record['description']}}"
    }
  };
  const photoLocation = L.geoJSON(geojsonFeature, {
    pointToLayer: function (feature, latlng) {
        return L.circleMarker(latlng);
    }
  });
  const map = L.map('map', {
    center: [{{record["latitude"]}}, {{record["longitude"]}}],
    zoom: 15,
    minZoom: 4,
    maxZoom: 17,
    layers: [openStreetMap, photoLocation],
    attributionControl: false,
  });
  </script>
</body>
</html>
