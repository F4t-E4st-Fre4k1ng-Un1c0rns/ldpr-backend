from abc import abstractmethod
from typing import Protocol

from sqlalchemy.ext.asyncio import AsyncSession

from src.adapters.database.repositories import (
    AnimeRepository,
    ClientRepository,
    EmailTemplateRepository,
    ManagerRepository,
    NewsContentRepository,
    NewsRepository,
    SeasonRepository,
)

class RepositoriesGatewayProtocol(Protocol):
    client: ClientRepository
    manager: ManagerRepository
    news: NewsRepository
    news_content: NewsContentRepository
    email_template: EmailTemplateRepository
    anime: AnimeRepository
    seasons: SeasonRepository

    @abstractmethod
    def __init__(self, session: AsyncSession):
        raise NotImplementedError
