from pathlib import Path

from flask import Flask, render_template_string, send_file

app = Flask(__name__)


@app.route("/")
def index() -> str:
    return ("To access a file, navigate to "
            "a directory.")


@app.route("/file/<path>")
def file(path) -> str:
    file = Path.home() / "qrshared" / path
    if file.exists() and file.is_file():
        return send_file(file)
    return render_template_string(
        "The file at {{ path | e }} does not exist.",
        path=path,
    )

