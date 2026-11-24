# Changelog

## 0.1.0 (unreleased, alpha)

- Streamable HTTP gateway (`POST /mcp/{alias}`) with Streamable HTTP and stdio upstreams.
- Static-token and OIDC authentication; RFC 9728 protected-resource metadata.
- Tool registry: SHA-256 pinning, reviewer diffs, rug-pull detection, shadowing detection, approve/revoke CLI.
- Policy: per-agent allowlists and argument constraints, taint egress rules, destructive and detection rules; builtin
  evaluator and OPA REST backend with Rego policies and tests.
- Detection: Tier 1 rules with normalisation, Tier 3 LLM judge (mock, OpenAI-compatible, Anthropic), cascade with cache.
- Session taint with shingle/atom provenance; DLP; rate limiting.
- Hash-chained audit log with `audit verify`.
- Docker image and gateway + OPA compose file.

Not included yet: approvals workflow, Tier 2 classifier, Redis/Postgres backends, resources/prompts mediation,
observability, admin UI, evaluation harness. See [docs/PROGRESS.md](docs/PROGRESS.md).
