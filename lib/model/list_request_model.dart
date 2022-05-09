class ListRequestModel {
  int? id;
  String? activity;

  ListRequestModel({this.id, this.activity});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'activity': activity,
    };

    return map;
  }
}
