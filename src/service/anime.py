from src.schemas.api.anime import AnimeInfo, AnimeOutput, AnimeSeasons
from src.unit_of_work import UnitOfWork


class AnimeService:
    def __init__(self, uow: UnitOfWork):
        self.uow = uow

    async def list_anime(self) -> AnimeOutput:
        models = await self.uow.repositories.anime.list_anime()
        return await self._map_output(models)

    async def _map_output(self, models):
        return AnimeOutput(
            items=[
                AnimeInfo(
                    name=i.name,
                    description=i.description,
                    poster_path=i.poster_path,
                    seasons=[
                        AnimeSeasons(id=i.id, number=i.number)
                        for i in await self.uow.repositories.seasons.list_seasons(
                            models.id
                        )
                    ],
                )
                for i in models
            ]
        )
