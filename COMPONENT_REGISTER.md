# Component Register

Minimum versions come from `pyproject.toml`; exact versions are pinned in `uv.lock`. License values are from package
metadata as generally published and should be re-verified before a release.

| Package | Min version | Source | License | Purpose | Approval |
|---|---|---|---|---|---|
| fastapi | 0.115 | PyPI | MIT | Gateway HTTP framework | brief |
| uvicorn | 0.30 | PyPI | BSD-3-Clause | ASGI server | brief |
| httpx | 0.27 | PyPI | BSD-3-Clause | Upstream, OPA and LLM-provider clients | brief |
| pydantic | 2.7 | PyPI | MIT | Contracts | brief |
| pyyaml | 6.0 | PyPI | MIT | YAML config and rules | brief |
| typer | 0.12 | PyPI | MIT | CLI | brief |
| sqlalchemy | 2.0 | PyPI | MIT | Audit log and registry persistence | brief |
| mcp | 1.12 (<2) | PyPI | MIT | Official SDK: mock servers and test clients (pinned below 2.0, whose API differs) | brief |
| jsonschema | 4.22 | PyPI | MIT | Tool argument validation (brief 4b) | owner blanket authorization; confirm (OI-003) |
| pyjwt[crypto] | 2.8 | PyPI | MIT | JWT validation (pulls `cryptography`: Apache-2.0 / BSD-3-Clause) | owner blanket authorization; confirm (OI-003) |
| pytest, pytest-asyncio, pytest-cov, hypothesis | see pyproject | PyPI | MIT / Apache-2.0 / MIT / MPL-2.0 | Testing | brief |
| ruff, mypy, types-PyYAML, types-jsonschema | see pyproject | PyPI | MIT / MIT / Apache-2.0 / Apache-2.0 | Lint and types | brief; types-jsonschema per OI-003 |
| Open Policy Agent (binary, dev/test and sidecar) | 1.22 | openpolicyagent.org / container image | Apache-2.0 | Rego tests, parity tests, full-mode policy engine | brief (approved external service) |
| regorus | - | not published on PyPI | MIT | Evaluated for lite mode; not added (ADR 003) | withdrawn |
| EvalView (dev/CI tool, not a project dependency) | 0.8.1 | PyPI + GitHub Action hidai25/eval-view | Apache-2.0 | Behavioural regression gate on scripted scenarios (`--no-judge`, telemetry off) | requested by owner; confirm (OI-016) |
