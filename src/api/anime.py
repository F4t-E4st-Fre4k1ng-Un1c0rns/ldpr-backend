from typing import Annotated

from fastapi import APIRouter, Depends
from schemas.api.anime import AnimeOutput
from service.anime import AnimeService

from src.unit_of_work import UnitOfWork

anime_router = APIRouter()


@anime_router.get("/anime", response_model=AnimeOutput)
async def get_all_anime_list(
    uow: Annotated[UnitOfWork, Depends(UnitOfWork)],
):
    async with uow:
        return await AnimeService(uow).list_anime()
