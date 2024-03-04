class GenresEntity {
  GenresEntity({
    required this.genres,
  });
  late final List<ItemEntity> genres;
}

class ItemEntity {
  ItemEntity({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;
}
