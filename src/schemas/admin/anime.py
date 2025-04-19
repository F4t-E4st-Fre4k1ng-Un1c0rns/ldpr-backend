from typing import Optional

from pydantic import BaseModel


class AnimeCreate(BaseModel):
    name: str
    description: str
    poster_path: str


class AnimeUpdate(BaseModel):
    name: Optional[str] = None
    description: Optional[str] = None
    poster_path: Optional[str] = None


class AnimeGet(BaseModel):
    name: str
    description: str
    poster_path: str


class AnimeList(BaseModel):
    id: int
    name: str
    description: str
    poster_path: str
