class WellSummaryModel {
  final int id;
  final String site_name;
  final String pad_name;
  final String well_name;

  WellSummaryModel.fromJson(Map json)
      : id = json['id'],
        site_name = json['site_name'],
        pad_name = json['pad_name'],
        well_name = json['well_name'];

  Map toJson() {
    return {
      'id': id,
      'site_name': site_name,
      'pad_name': pad_name,
      'well_name': well_name
    };
  }
}
