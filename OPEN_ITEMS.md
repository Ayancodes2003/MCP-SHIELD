# Open Items

| ID | Item | Status |
|---|---|---|
| OI-001 | Define the "elephant-goldfish" review model | open |
| OI-002 | Approval authority and worktree/lock conventions for concurrent agents | open |
| OI-003 | Packages beyond brief Section 2 added during 0.1 under the owner's blanket authorization: `jsonschema` (argument validation), `PyJWT[crypto]` + `cryptography` (JWT/JWKS), `types-jsonschema` (dev). Confirm | open: confirm |
| OI-004 | Verify the Tier 2 model (`protectai/deberta-v3-base-prompt-injection-v2`) license and ONNX availability before implementing Tier 2 | open |
| OI-005 | Development uses Python 3.14.7; wheels for ML extras (onnxruntime, tokenizers) on 3.14 must be verified when Tier 2 starts; container image uses 3.12 | open |
| OI-006 | CI: `opa` must be installed so the Rego tests and the parity tests run; they skip when it is missing | open |
| OI-007 | Lite-mode policy backend: `regorus` is not on PyPI; resolved by ADR 003 (builtin evaluator + parity tests) | resolved |
| OI-008 | Brief Section 4f cites "Section 9" for approvals; should be 5.5 | open |
| OI-009 | Not in 0.1: approvals workflow (LangGraph), Tier 2 ONNX classifier, Redis rate limit/session/cache, Postgres driver and integration tests, Alembic migrations, `resources/*` and `prompts/*` mediation, OTel, admin UI, LLM-agent driver and AgentDojo/InjecAgent adapters, adaptive attacker, Keycloak compose | open (see docs/PROGRESS.md) |
| OI-010 | OIDC validation has only been tested against locally generated keys, not a real IdP | open |
| OI-011 | Failed-auth attempts are audited without rate limiting; unbounded audit growth under abuse | open |
| OI-012 | Taint reset endpoint / admin action for independent tasks of one agent (ADR 006) | open |
| OI-013 | Wheel includes `authz_test.rego` (hatch `exclude` does not apply to `force-include`); harmless but untidy | open |
| OI-014 | PyPI publication: choose package ownership, set up trusted publishing, TestPyPI dry run | open |
| OI-015 | Pin third-party GitHub Actions (setup-uv, setup-opa, hidai25/eval-view) by commit SHA; currently pinned by tag | open |
| OI-016 | EvalView (Apache-2.0) is a dev/CI tool installed outside the project lock (uv tool / pip in CI, version 0.8.1); it sends anonymous telemetry unless turned off. Confirm acceptance | open: confirm |
