class Content {
  final String? title;
  final String? code;
  final String? subtitle;

  Content({this.title, this.code, this.subtitle});

  factory Content.fromMap(Map<String, dynamic> json) {
    return Content(
      title: json['title'],
      code: json['code'],
      subtitle: json['subtitle'],
    );
  }
}
