class SeriesGenresEntity {
  SeriesGenresEntity({
    required this.genres,
  });
   List<ItemEntity> genres;
}

class ItemEntity {
  ItemEntity({
    required this.id,
    required this.name,
  });
   int id;
   String name;
}
