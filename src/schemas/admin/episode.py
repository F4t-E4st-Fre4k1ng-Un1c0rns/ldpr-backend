from typing import Optional

from pydantic import BaseModel


class EpisodeCreate(BaseModel):
    number: int
    season_id: int
    name: str
    path: str


class EpisodeUpdate(BaseModel):
    number: Optional[int] = None
    season_id: Optional[int] = None
    name: Optional[str] = None
    path: Optional[str] = None


class EpisodeGet(BaseModel):
    number: int
    season_id: int
    name: str
    path: str


class EpisodeList(BaseModel):
    id: int
    number: int
    season_id: int
    name: str
    path: str

