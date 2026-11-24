# MCP Security Gateway — Agent Instructions

## Purpose and Scope

These instructions apply to all coding agents working in this repository. The project is the MCP Security Gateway (`mcp-shield`): a security proxy between AI agents (MCP clients) and upstream MCP servers that enforces authentication, authorization, detection, taint tracking, approvals, and a tamper-evident audit log. The full brief and milestones are in project_reference.txt. The FastAPI gateway endpoints, Jinja2 admin UI, typer CLI, and OpenTelemetry tracing and metrics are in scope per that brief; do not add other REST APIs, web interfaces, command-line interfaces, or observability tooling unless explicitly requested. Do not refactor working code. The standard-library `logging` module is permitted.

## Technology and Architecture

- Python 3.12 managed with uv; Polars; Pydantic v2; PyYAML. The full stack is in project_reference.txt Section 2.
- Persistence uses Postgres 16 (audit log, approvals, tool registry, LangGraph checkpoints) and Redis 7 (rate limiting, session state, caches). SQLAlchemy 2.x and Alembic handle database access and migrations. SQLite is used only for isolated tests.
- Config: `config/` (gateway.yaml, agents.yaml, servers.yaml, tool_labels.yaml).
- Upstream transports are in `src/mcp_shield/proxy/`; evaluation adapters are in `evals/adapters/`.
- Source code is in `src/mcp_shield/` by subsystem: proxy, auth, registry, policy, detection, taint, approvals, audit, ratelimit, dlp, telemetry, ui.
- Policies: `policies/` (Rego, tested with `opa test`). Evaluation harness: `evals/`. Mock MCP servers: `mock_servers/`.
- Tests: `tests/`, grouped by subsystem.
- Documentation: `docs/`, organized by topic and document type. `README.md` is the repository entry point; `OPEN_ITEMS.md` and `COMPONENT_REGISTER.md` remain at the repository root.

See [project_reference.txt](project_reference.txt) for the project brief and milestones.

## Implementation Conventions

- Follow PEP 8 and use type hints on all function signatures.
- Use `snake_case` for Python modules, functions, and variables; `PascalCase` for classes; and `UPPER_SNAKE_CASE` for constants. Tests use `test_*.py`.
- Use Polars, not pandas, for DataFrame operations.
- Use Pydantic v2 contracts where defined; do not bypass validation or replace established models with untyped dictionaries.
- Keep adapter-specific reading in its adapter module; business validation and policy decisions remain in their owning modules.
- Rejected or blocked input must be recorded in the audit log; never silently discard invalid or blocked input.
- Keep raw SQL inside repository modules (`registry/`, `audit/`, `approvals/`) unless a migration or database-specific operation requires it.
- Write concise docstrings for public functions and classes.
- Use existing dependencies and utilities where possible. Any new package requires explicit approval before editing `pyproject.toml`, and must be recorded in `COMPONENT_REGISTER.md` with version, source, and license. Packages must permit commercial use and must not require unmanaged system-level runtime dependencies; Postgres 16 and Redis 7 are approved external services, and the packages listed in project_reference.txt Section 2 are pre-approved.
- Do not add packages that duplicate existing functionality. Prefer lightweight, maintained options.

## Tests and Validation

Use the repository virtual environment and pytest. Use existing `conftest.py` fixtures and `tmp_path` for generated test files. Tests must exercise policy, validation, and detection contracts, not skip them. Add tests alongside changed behavior.

```powershell
python -m pytest -q
python -m pytest tests/unit/ -q
python -m pytest tests/integration/ -q
python -m pytest tests/e2e/ -q
```

Lint and coverage (configured in `pyproject.toml`; dev tools are the `dev` optional dependency group):

```powershell
python -m ruff check .
python -m ruff format --check .
python -m pytest -q --cov
```

- Milestone gate: `ruff check .` must report no errors, `ruff format --check .` must pass, and total coverage over `src/mcp_shield/` must be at least 85% (`fail_under`; line coverage). Run both before declaring a milestone complete.
- Do not lower the threshold, widen the lint ignores, or add blanket `# noqa` or `# pragma: no cover` to pass the gate. Any exception needs a recorded decision in `OPEN_ITEMS.md`.
- Lint rule set: Ruff `E`, `F`, `W`, `I`, `B` at a 120-character line length. Format code with `ruff format` before running the gate.

Postgres integration tests are opt-in and require `MCP_SHIELD_TEST_DATABASE_URL` pointed at a disposable test database.

## Change Management and Records

- Implement and test in the current worktree. Do not commit, create branches, or merge unless explicitly requested.
- Changes must be reviewed and approved before merging into the main branch. Approval authority and worktree conventions remain an open team decision in `OPEN_ITEMS.md` and ensure that multiple agents don't overwrite each other's work. Maintain lock mechanism for coordinating concurrent edits.
- Maintain `OPEN_ITEMS.md` on the main branch only. In other worktrees, report newly discovered follow-up items in the PR or handoff instead of editing that file.
- Keep `COMPONENT_REGISTER.md` current when adding packages or major components.
- Follow the team's elephant-goldfish review model; its definition is tracked as an open item until agreed.
- Keep all maintained project documentation in the `docs/` wiki, organized by topic/type, and consistent with implemented behavior. Update `README.md` as the repository entry point when documentation locations change.



## Environment Setup

```powershell
uv sync --all-extras
.\.venv\Scripts\Activate.ps1
python -m pytest -q
```
Dependencies are declared in `pyproject.toml` and pinned in `uv.lock`.



