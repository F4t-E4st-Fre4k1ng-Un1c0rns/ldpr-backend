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
                    name=anime_model.name,
                    description=anime_model.description,
                    poster_path=anime_model.poster_path,
                    seasons=[
                        AnimeSeasons(id=season_model.id, number=season_model.number)
                        for season_model in await self.uow.repositories.seasons.list_seasons(
                            anime_model.id
                        )
                    ],
                )
                for anime_model in models
            ]
        )
