from fastapi import APIRouter

from .count import count_router

v1_router = APIRouter()

v1_router.include_router(count_router)
