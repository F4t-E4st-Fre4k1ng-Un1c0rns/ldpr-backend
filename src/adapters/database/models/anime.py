from sqlalchemy import BIGINT, TIMESTAMP, ForeignKey, String
from sqlalchemy.dialects.postgresql import ARRAY
from sqlalchemy.orm import Mapped, mapped_column, relationship


from .base import Base


class Anime(Base):
    __tablename__ = "anime"
    id: Mapped[int] = mapped_column(primary_key=True,autoincrement=True)

    name: Mapped[str] = mapped_column(String(50))
    description: Mapped[str]
    poster_path: Mapped[str]
    seasons: Mapped["Season"] = relationship()

    def __str__(self):
        return f"{self.name}"


class Season(Base):
    __tablename__ = "seasons"

    id: Mapped[int] = mapped_column(primary_key=True,autoincrement=True)
    anime_id: Mapped[str] = mapped_column(ForeignKey(Anime.id))
    number: Mapped[int]


class Episode(Base):
    __tablename__ = "episodes"
    id: Mapped[int] = mapped_column(primary_key=True,autoincrement=True)
    season_id: Mapped[int] = mapped_column(ForeignKey(Season.id))
    number: Mapped[int]
    name: Mapped[str]
    path: Mapped[str]
    
