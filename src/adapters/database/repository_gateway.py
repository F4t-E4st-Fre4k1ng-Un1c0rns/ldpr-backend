from sqlalchemy.ext.asyncio import AsyncSession

from src.adapters.database.repositories import (
    AnimeRepository,
    ClientRepository,
    EmailTemplateRepository,
    EpisodeRepository,
    ManagerRepository,
    NewsContentRepository,
    NewsRepository,
    SeasonRepository,
)
from src.utils.repositories_gateway import RepositoriesGatewayProtocol


class RepositoriesGateway(RepositoriesGatewayProtocol):
    def __init__(self, session: AsyncSession):
        self.client = ClientRepository(session)
        self.manager = ManagerRepository(session)
        self.news = NewsRepository(session)
        self.news_content = NewsContentRepository(session)
        self.email_template = EmailTemplateRepository(session)
        self.anime = AnimeRepository(session)
        self.seasons = SeasonRepository(session)
        self.episodes = EpisodeRepository(session)
