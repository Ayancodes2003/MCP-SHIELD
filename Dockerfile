FROM python:3.12-slim AS build
RUN pip install --no-cache-dir uv
WORKDIR /src
COPY pyproject.toml README.md LICENSE ./
COPY src ./src
COPY policies ./policies
RUN uv build --wheel --out-dir /dist

FROM python:3.12-slim
RUN useradd --system --uid 10001 --home-dir /app --create-home shield \
 && mkdir -p /app/data /app/config && chown -R shield /app
COPY --from=build /dist/*.whl /tmp/
RUN pip install --no-cache-dir /tmp/*.whl && rm -f /tmp/*.whl
USER 10001
WORKDIR /app
EXPOSE 8080
HEALTHCHECK --interval=15s --timeout=3s --retries=3 \
  CMD python -c "import urllib.request,sys; sys.exit(0 if urllib.request.urlopen('http://127.0.0.1:8080/healthz', timeout=2).status==200 else 1)"
ENTRYPOINT ["mcp-shield"]
CMD ["serve", "--config", "/app/config/gateway.yaml", "--host", "0.0.0.0", "--port", "8080"]
