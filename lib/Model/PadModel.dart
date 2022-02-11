class PadModel {
  int id;
  String name;
  int siteId;

  PadModel.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        siteId = json['siteId'];
}
