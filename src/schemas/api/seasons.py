from pydantic import BaseModel, ConfigDict, field_validator
from pydantic.alias_generators import to_camel

from src.settings import settings


class SeasonOutput(BaseModel):
    model_config = ConfigDict(
        alias_generator=to_camel,
        from_attributes=True,
        populate_by_name=True,
    )
    items: list["SeasonInfo"]



class SeasonInfo(BaseModel):
    model_config = ConfigDict(
        alias_generator=to_camel,
        from_attributes=True,
        populate_by_name=True,
    )

    number: int

