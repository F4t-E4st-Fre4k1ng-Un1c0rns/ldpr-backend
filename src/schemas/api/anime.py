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

    name: str
    description: str
    poster_path: str

    @field_validator("banner_path")
    @classmethod
    def make_url(cls, banner_path: str) -> str:
        return settings.s3_url + banner_path
