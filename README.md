# fastapi-starter
Starter FastAPI boilerplate I typically use for my projects


## Stack

- FastAPI
- Pydantic
- uv
- Docker
- Docker compose


## Project Structure


├── docker-compose.yml
├── Dockerfile
├── LICENSE
├── pyproject.toml
├── README.md
├── src
│   ├── app
│   │   ├── api
│   │   │   ├── __init__.py
│   │   │   ├── __pycache__
│   │   │   └── v1
│   │   │       ├── count.py
│   │   │       ├── __init__.py
│   │   │       └── __pycache__
│   │   ├── core
│   │   │   └── config
│   │   │       └── __init__.py
│   │   ├── __init__.py
│   │   ├── main.py
│   │   ├── modules
│   │   │   └── __init__.py
│   │   └── __pycache__
│   └── tests
│       ├── conftest.py
│       ├── integration
│       │   └── __init__.py
│       └── unit
│           └── __init__.py
└── uv.lock


