from fastadmin import WidgetType, register

from src.adapters.database.models import Episode
from src.adapters.database.repositories import EpisodeRepository
from src.admin.override_fastadmin import CustomModelAdmin
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

    list_display = ("number", "name")
    list_display_links = ("number",)
    list_filter = ("number", "name")

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
