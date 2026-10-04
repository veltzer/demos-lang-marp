# TOFIX

Findings from a code scan on 2026-10-04.

## Medium

- `marp/mermaid_external.md:16` - the "working approach" deck tells you to run `mmdc -i mermaid/one.mmd`, but there is no `mermaid/one.mmd` (the only source is `mermaid/sample.mmd`), and the image it shows, `images/mermaid_one.svg` (line 23), is a committed 0-byte file, so the slide renders blank; render `mermaid/sample.mmd` into a real SVG and fix the command and file names.
- `scripts/convert-marp-mermaid_2.sh:27` - `python3 -m http.server 8080` serves the current directory, but the HTML was written by `mktemp` into `/tmp` (line 19), so `decktape` at line 35 fetches a 404 page; write the HTML into a temp dir and start the server with `--directory` on it (and avoid `npm install -g` at line 15).
- `scripts/check_md.py:46` - `_LINK_RE` is anchored with `^` but compiled without `re.MULTILINE` and applied to the whole file with `finditer` (line 87), so `--links` (enabled in `rsconstruct.toml:74`) only ever looks at the very first characters of a file and never reports a broken link; add `re.MULTILINE` (or drop the anchor).
- `rsconstruct.toml:38` - the decks under `marp/` are only linted, never rendered: there is no `[processor.marp]` (as in teaching-slides), so a deck that marp-cli cannot build is never caught; add a marp processor for `marp/`.

## Low

- `package.json:4` - `@marp-team/marpit` and `markdown-it-admon` (line 6) are not used anywhere (no custom engine in `.marprc.mjs`), and `decktape` (line 5) is only used by the script that installs it globally itself; drop the unused packages and refresh `package-lock.json`.
- `scripts/check_md.py:17` - docstring and options (`--title-svg`, `--title-count`, 00_title.md, `marp/courses/foo.md` usage) describe teaching-slides course structure that does not exist here; trim the copied checks this repo does not use or note that the file is copied from teaching-slides.
- `pyproject.toml:14` - `pytest` is in the dev group but the repo has no tests and no pytest processor; drop it. `pyproject.toml:25` `mypy_path = "src:python:scripts"` names `src/` and `python/` directories that do not exist; reduce it to `scripts`.
- `rsconstruct.toml:48` - `ruff`/`mypy` (line 52) and `shellcheck` (line 57) list `config` in `src_dirs`, but `config/` holds only `.lua` files; drop it.
