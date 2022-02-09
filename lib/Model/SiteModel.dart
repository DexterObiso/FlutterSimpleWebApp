class SiteModel {
  final int id;
  final String name;

  SiteModel.fromJson(Map json)
      : id = json['id'],
        name = json['name'];

  Map toJson() {
    return {'id': id, 'name': name};
  }
}
