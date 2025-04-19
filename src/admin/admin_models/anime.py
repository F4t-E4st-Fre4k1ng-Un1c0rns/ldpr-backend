from fastadmin import WidgetType, register

from src.adapters.database.models import Anime
from src.adapters.database.repositories import AnimeRepository
from src.admin.override_fastadmin import CustomModelAdmin
from src.schemas.admin.anime import (
    AnimeCreate,
    AnimeGet,
    AnimeList,
    AnimeUpdate,
)


@register(Anime)
class AnimeAdmin(CustomModelAdmin):
    Anime.__name__ = verbose_name = verbose_name_plural = "Аниме"

    schemaCreate = AnimeCreate
    schemaUpdate = AnimeUpdate
    schemaGet = AnimeGet
    schemaList = AnimeList

    model_repository = AnimeRepository

    list_display = ("name", "description")
    list_display_links = ("name",)
    list_filter = ("name", "description")

    search_fields = ("name", "description")

    fieldsets = (
        (
            None,
            {
                "fields": (
                    "name",
                    "description",
                    "poster_path",
                )
            },
        ),
    )
    formfield_overrides = {
        "name": (WidgetType.Input, {"required": True}),
        "description": (WidgetType.TextArea, {"required": True}),
        "poster_path": (WidgetType.Input, {"required": True}),
    }
