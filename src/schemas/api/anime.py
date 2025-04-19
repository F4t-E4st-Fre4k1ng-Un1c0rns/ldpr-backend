from pydantic import BaseModel, ConfigDict, field_validator
from pydantic.alias_generators import to_camel

from src.settings import settings


class AnimeOutput(BaseModel):
    model_config = ConfigDict(
        alias_generator=to_camel,
        from_attributes=True,
        populate_by_name=True,
    )
    items: list["AnimeInfo"]



class AnimeInfo(BaseModel):
    model_config = ConfigDict(
        alias_generator=to_camel,
        from_attributes=True,
        populate_by_name=True,
    )

    id: int
    name: str
    description: str
    poster_path: str
    seasons: list["AnimeSeasons"]

    @field_validator("poster_path")
    @classmethod
    def make_url(cls, banner_path: str) -> str:
        return settings.s3_url + banner_path

class AnimeSeasons(BaseModel):
    model_config = ConfigDict(
        alias_generator=to_camel,
        from_attributes=True,
        populate_by_name=True,
    )
    id: int
    number: int
