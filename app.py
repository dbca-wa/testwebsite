from random import random
from time import sleep

from bottle import Bottle, request, run, static_file, template

app = application = Bottle()

RECORDS = [
    {
        "id": 1,
        "name": "Tonsai",
        "description": "A view over Tonsai beach.",
        "filename": "landscape01.jpg",
    },
    {
        "id": 2,
        "name": "Railay",
        "description": "A view over Railay.",
        "filename": "landscape02.jpg",
    },
    {
        "id": 3,
        "name": "Phrang Beach",
        "description": "Phrang Beach at sunset.",
        "filename": "landscape03.jpg",
    },
    {
        "id": 4,
        "name": "Thaiwand Wall",
        "description": "The view from Thaiwand Wall towards Tonsai.",
        "filename": "landscape04.jpg",
    },
    {
        "id": 5,
        "name": "Long Boats",
        "description": "Long boats moored at the jetty.",
        "filename": "landscape05.jpg",
    },
]


def find_record_by_id(record_id: int):
    """Helper function to get requested record."""
    return next((r for r in RECORDS if r["id"] == record_id), None)


def search_records(query: str):
    """Helper function to query data."""
    q = query.strip().lower()
    if not q:
        return []

    def hit(r):
        return (
            q in str(r["id"]).lower()
            or q in r["name"].lower()
            or q in r["description"].lower()
        )

    sleep(random())  # Random delay
    return [r for r in RECORDS if hit(r)]


@app.get("/")
def index():
    """
    Front page:
    - Shows search form
    - If ?q= is present, shows results
    """
    q = request.query.q or ""
    results = search_records(q) if q else []
    sleep(random())  # Random delay
    return template("index", q=q, results=results)


@app.get("/record/<record_id:int>")
def record_detail(record_id):
    """
    Shows a single record's details
    """
    record = find_record_by_id(record_id)
    sleep(random())  # Random delay
    if not record:
        return template("detail", record=None, record_id=record_id)
    return template("detail", record=record, record_id=record_id)


@app.get("/static/<filepath:path>")
def server_static(filepath):
    return static_file(filepath, root="./static")


if __name__ == "__main__":
    # Debug server
    run(app, host="0.0.0.0", port=8080, debug=True, reloader=True)
