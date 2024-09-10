class EvolutionChain {
  final String? id;
  final String? name;
  final String? imageUrl;

  EvolutionChain({
    this.id,
    this.name,
    this.imageUrl,
  });

  factory EvolutionChain.fromJson(Map<String, dynamic> json) {
    return EvolutionChain(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }
}
