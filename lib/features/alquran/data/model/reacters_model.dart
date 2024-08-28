class ReactersModel {
  final String name;
  final int id;
  final String server;

  ReactersModel({required this.name, required this.id, required this.server});

  factory ReactersModel.fromJson(json) {
    return ReactersModel(
      name: json['name'],
      id: json['id'],
      server: json['moshaf'][0]['server'],
    );
  }
}
