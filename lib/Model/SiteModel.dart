class SiteModel {
  int id;
  String name;

  SiteModel.fromJson(Map json)
      : id = json['id'],
        name = json['name'];
}
