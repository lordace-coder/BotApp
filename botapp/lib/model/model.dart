class DataModel {
  final String title;
  final String body;
  DataModel({required this.title, required this.body});

  factory DataModel.fromjson(Map<String, dynamic> json) {
    return DataModel(title: json['title'] ?? '', body: json['body'] ?? '');
  }
}
