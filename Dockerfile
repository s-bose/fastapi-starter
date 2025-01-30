FROM python:3.11-slim as builder

COPY --from=ghcr.io/astral-sh/uv:0.5.25 /uv /uvx /bin/

# Compile bytecode
# Ref: https://docs.astral.sh/uv/guides/integration/docker/#compiling-bytecode
ENV UV_COMPILE_BYTECODE=1

# uv Cache
# Ref: https://docs.astral.sh/uv/guides/integration/docker/#caching
ENV UV_LINK_MODE=copy

COPY ./src /src
COPY ./pyproject.toml /src
COPY ./uv.lock /src

WORKDIR /src

# Install dependencies
# Ref: https://docs.astral.sh/uv/guides/integration/docker/#intermediate-layers
RUN --mount=type=cache,target=/root/.cache/uv \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync --frozen --no-install-project

# Place executables in the environment at the front of the path
ENV PATH="/src/.venv/bin:$PATH"

# Sync the project
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --frozen

# Reset the entrypoint, don't invoke `uv`
ENTRYPOINT []


EXPOSE 8000


# Run the FastAPI application by default
# Uses `fastapi dev` to enable hot-reloading when the `watch` sync occurs
# Uses `--host 0.0.0.0` to allow access from outside the container
CMD ["fastapi", "dev", "--host", "0.0.0.0", "--app", "app"]


