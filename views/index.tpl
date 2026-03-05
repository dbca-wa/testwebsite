<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Search</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <style>
    body { font-family: system-ui, -apple-system, Segoe UI, Roboto, Arial, sans-serif; margin: 2rem; }
    form { display: flex; gap: 0.5rem; max-width: 600px; }
    input[type="text"] { flex: 1; padding: 0.6rem 0.8rem; }
    button { padding: 0.6rem 0.9rem; cursor: pointer; }
    .results { margin-top: 1.25rem; }
    .card { border: 1px solid #e5e7eb; border-radius: 10px; padding: 1rem; margin-bottom: 0.75rem; }
    .meta { color: #6b7280; font-size: 0.9rem; }
    a { text-decoration: none; color: #2563eb; }
    a:hover { text-decoration: underline; }
  </style>
</head>
<body>
  <h1>Search photos</h1>

  <form id="id_search_form" method="get" action="/">
    <input id="id_search_text" type="text" name="q" value="{{q or ''}}" placeholder="Search by id, name or description" />
    <button id="id_search_submit" type="submit">Search</button>
  </form>

  % if q:
    <div class="results" id="id_search_results">
      <p><strong>Query:</strong> "{{q}}"</p>
      % if results:
        % for r in results:
          <div class="card" id="id_result_{{r['id']}}">
            <h3 style="margin: 0.2rem 0;"><a id="id_url_detail_{{r['id']}}" class="a_url_detail" href="/record/{{r['id']}}">{{r["name"]}}</a></h3>
            <p style="margin: 0.2rem 0;">{{r["description"]}}</p>
            <p><img src="/static/{{r["filename"]}}" height="250"></p>
            <p style="margin: 0.2rem 0;"><a href="/record/{{r['id']}}">View details →</a></p>
          </div>
        % end
      % else:
        <p>No results found.</p>
      % end
    </div>
  % else:
    <p class="results">Try a query like <code>boat</code> or <code>tonsai</code>.</p>
  % end
</body>
</html>
