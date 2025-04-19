from typing import Annotated

from fastapi import APIRouter, Depends
from schemas.api.anime import AnimeOutput
from schemas.api.seasons import SeasonOutput
from service.anime import AnimeService
from service.seasons import SeasonService

from src.unit_of_work import UnitOfWork

anime_router = APIRouter()


@anime_router.get("/anime", response_model=AnimeOutput)
async def get_all_anime_list(
    uow: Annotated[UnitOfWork, Depends(UnitOfWork)],
):
    async with uow:
        return await AnimeService(uow).list_anime()

@anime_router.get("/anime/{id}", response_model=SeasonOutput)
async def get_all_seasons_list(
    uow: Annotated[UnitOfWork, Depends(UnitOfWork)],
    id: int
):
    async with uow:
        return await SeasonService(uow).list_seasons(id)
