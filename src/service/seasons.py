from schemas.api.seasons import SeasonOutput, SeasonInfo
from src.unit_of_work import UnitOfWork


class SeasonService:
    def __init__(self, uow: UnitOfWork):
        self.uow = uow

    async def list_seasons(self, anime_id: int) -> SeasonOutput:
        models = await self.uow.repositories.seasons.list_seasons(anime_id)
        return self._map_output(models)

    def _map_output(self, models):
        return SeasonOutput(
            items=[
                SeasonInfo(number=i.number)
                for i in models
            ]
        )
