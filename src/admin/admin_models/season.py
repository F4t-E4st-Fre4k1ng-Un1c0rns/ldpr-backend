from fastadmin import WidgetType, register

from src.adapters.database.models import Anime, Season
from src.adapters.database.repositories import SeasonRepository
from src.admin.override_fastadmin import CustomColumn, CustomModelAdmin
from src.schemas.admin.season import (
    SeasonCreate,
    SeasonGet,
    SeasonList,
    SeasonUpdate,
)


@register(Season)
class SeasonAdmin(CustomModelAdmin):
    Season.__name__ = verbose_name = verbose_name_plural = "Сезон"

    schemaCreate = SeasonCreate
    schemaUpdate = SeasonUpdate
    schemaGet = SeasonGet
    schemaList = SeasonList

    model_repository = SeasonRepository
    custom_columns = [
        CustomColumn(
            column_name="аниме",
            join_field=Season.anime,
            get_new_value=(lambda record: str(record.anime)),
            filter={
                "exact": lambda value: Anime.name.ilike(f"%{value}%"),
                "icontains": lambda value: Anime.name.ilike(f"%{value}%"),
            },
        ),
    ]

    list_display = ("аниме", "number")
    list_display_links = ("number",)
    list_filter = ("аниме", "number")

    search_fields = ("number",)

    raw_id_fields = ("anime_id",)

    fieldsets = (
        (
            None,
            {
                "fields": (
                    "number",
                    "anime",
                )
            },
        ),
    )
    formfield_overrides = {
        "number": (WidgetType.InputNumber, {"required": True}),
        # "anime_id": (WidgetType.InputNumber, {"required": True}),
    }
