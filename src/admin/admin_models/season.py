from fastadmin import WidgetType, register

from src.adapters.database.models import Season
from src.adapters.database.repositories import SeasonRepository
from src.admin.override_fastadmin import CustomModelAdmin
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

    list_display = ("number",)
    list_display_links = ("number",)
    list_filter = ("number",)

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
