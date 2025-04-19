from typing import Optional

from pydantic import BaseModel


class SeasonCreate(BaseModel):
    number: int
    anime_id: int


class SeasonUpdate(BaseModel):
    number: Optional[int] = None
    anime_id: Optional[int] = None


class SeasonGet(BaseModel):
    number: int
    anime_id: int


class SeasonList(BaseModel):
    id: str
    number: int
    anime_id: int

