class Source {
  final String name;
  final String? id;
  Source(this.id, this.name);

  Source.fromJson(Map<String, Object?> json)
      : this(json['id'] as String?, json['name']! as String);
}
