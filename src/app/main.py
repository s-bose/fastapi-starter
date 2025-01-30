import os
from fastapi import FastAPI
from fastapi.responses import JSONResponse
from app import __version__
from app.api.v1 import v1_router


app = FastAPI(
    title=os.getenv("PROJECT_NAME", "backend"),
    version=__version__,
)

app.include_router(v1_router, prefix="/api/v1")


@app.get("/")
async def get_root():
    return JSONResponse({"message": "Service is up and running"}, 200)


@app.get("/health")
async def get_health():
    return JSONResponse({"ping": "pong"}, 200)
