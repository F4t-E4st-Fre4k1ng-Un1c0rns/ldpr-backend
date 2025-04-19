from src.adapters.database.models.anime import Season
from src.schemas.api.seasons import EpisodesInfo, SeasonOutput, SeasonInfo
from src.unit_of_work import UnitOfWork


class SeasonService:
    def __init__(self, uow: UnitOfWork):
        self.uow = uow
    async def list_seasons(self, anime_id: int) -> SeasonOutput:
        models = await self.uow.repositories.seasons.list_seasons(anime_id)
        return await self._map_output(models)

    async def _map_output(self, models: list[Season]):
        return SeasonOutput(
            items=[
                SeasonInfo(
                    id=i.id,
                    number=i.number,
                    episodes=[
                        EpisodesInfo(number=j.number, name=j.name, path=j.path)
                        for j in await self.uow.repositories.episodes.list_episodes(i.id)
                    ],
                )
                for i in models
            ]
        )
