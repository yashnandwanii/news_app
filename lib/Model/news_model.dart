class NewsModel {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  NewsModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  NewsModel.fromJson(Map<String, dynamic> json) {
    source = json["source"] != null ? Source.fromJson(json["source"]) : null;
    author = json["author"];
    title = json["title"];
    description = json["description"];
    url = json["url"];
    urlToImage = json["urlToImage"];
    publishedAt = json["publishedAt"] != null
        ? DateTime.tryParse(json["publishedAt"])
        : null;
    content = json["content"];
  }

  static List<NewsModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((e) => NewsModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (source != null) {
      data["source"] = source!.toJson();
    }
    data["author"] = author;
    data["title"] = title;
    data["description"] = description;
    data["url"] = url;
    data["urlToImage"] = urlToImage;
    data["publishedAt"] = publishedAt?.toIso8601String();
    data["content"] = content;
    return data;
  }
}

class Source {
  dynamic id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  static List<Source> fromList(List<Map<String, dynamic>> list) {
    return list.map((e) => Source.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
    };
  }
}
