from fastadmin import WidgetType, register

from src.adapters.database.models import Episode
from src.adapters.database.repositories import EpisodeRepository
from src.admin.override_fastadmin import CustomColumn, CustomModelAdmin
from src.schemas.admin.episode import (
    EpisodeCreate,
    EpisodeGet,
    EpisodeList,
    EpisodeUpdate,
)


@register(Episode)
class EpisodeAdmin(CustomModelAdmin):
    Episode.__name__ = verbose_name = verbose_name_plural = "Эпизод"

    schemaCreate = EpisodeCreate
    schemaUpdate = EpisodeUpdate
    schemaGet = EpisodeGet
    schemaList = EpisodeList

    model_repository = EpisodeRepository
    custom_columns = [
        CustomColumn(
            column_name="аниме и сезон",
            join_field=Episode.season,
            get_new_value=(lambda record: str(record.season)),
            filter={
                "exact": lambda value: Episode.season.ilike(f"%{value}%"),
                "icontains": lambda value: Episode.season.ilike(f"%{value}%"),
            },
        ),
    ]

    list_display = ("аниме и сезон", "number", "name")
    list_display_links = ("number",)
    list_filter = ("аниме и сезон", "number", "name")

    search_fields = ("number", "name")

    raw_id_fields = ("season_id",)

    fieldsets = (
        (
            None,
            {
                "fields": (
                    "season",
                    "number",
                    "name",
                    "path"
                )
            },
        ),
    )
    formfield_overrides = {
        "number": (WidgetType.InputNumber, {"required": True}),
        "name": (WidgetType.Input, {"required": True}),
        "path": (WidgetType.Input, {"required": True}),
    }
