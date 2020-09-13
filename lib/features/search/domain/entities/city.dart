class City {
  final String keyword;
  final int id;
  final String autocompleteterm;
  final String country;

  const City({
    this.keyword,
    this.id,
    this.autocompleteterm,
    this.country,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      keyword: json["keyword"],
      id: json["id"],
      autocompleteterm: json["autocompleteTerm"],
      country: json["country"],
    );
  }
}
