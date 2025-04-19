from fastadmin import WidgetType, register

from src.adapters.database.models import Episode
from src.adapters.database.repositories import EpisodeRepository
from src.admin.override_fastadmin import CustomModelAdmin
# from src.schemas.admin.season import (
#     AnimeCreate,
#     AnimeGet,
#     AnimeList,
#     AnimeUpdate,
# )


@register(Episode)
class EpisodeAdmin(CustomModelAdmin):
    Episode.__name__ = verbose_name = verbose_name_plural = "Эпизод"

    # schemaCreate = AnimeCreate
    # schemaUpdate = AnimeUpdate
    # schemaGet = AnimeGet
    # schemaList = AnimeList

    model_repository = EpisodeRepository

    list_display = ("season_id", "number", "name")
    list_display_links = ("number",)
    list_filter = ("season_id", "number", "name")

    search_fields = ("season_id", "number", "name")

    fieldsets = (
        (
            None,
            {
                "fields": (
                    "season_id",
                    "number",
                    "name",
                    "path"
                )
            },
        ),
    )
    formfield_overrides = {
        "season_id": (WidgetType.InputNumber, {"required": True}),
        "number": (WidgetType.InputNumber, {"required": True}),
        "name": (WidgetType.Input, {"required": True}),
        "path": (WidgetType.Input, {"required": True}),
    }
