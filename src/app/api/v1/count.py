from contextvars import ContextVar
from fastapi import APIRouter

count_router = APIRouter()

counter: ContextVar[int] = ContextVar("count", default=42)


@count_router.get("/count")
async def get_count():
    counter.set(counter.get() + 1)

    return counter.get()
