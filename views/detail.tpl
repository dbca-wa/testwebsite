<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>{{record["name"]}}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <style>
    body { font-family: system-ui, -apple-system, Segoe UI, Roboto, Arial, sans-serif; margin: 2rem; }
    .card { border: 1px solid #e5e7eb; border-radius: 10px; padding: 1rem; }
    .meta { color: #6b7280; font-size: 0.95rem; }
    a { text-decoration: none; color: #2563eb; }
    a:hover { text-decoration: underline; }
  </style>
</head>
<body>
  <p><a id="id_search" href="/">&larr; Back to search</a></p>

  % if record:
    <div class="card">
      <h1 style="margin: 0.2rem 0 0.6rem;">{{record["name"]}}</h1>
      <p>{{record["description"]}}</p>
      <p><img src="/static/{{record["filename"]}}"></p>
    </div>
  % else:
    <h1>Record not found</h1>
    <p>I couldn't find a record with ID <strong>{{record_id}}</strong>.</p>
  % end
</body>
</html>
