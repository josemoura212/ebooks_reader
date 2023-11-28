import 'dart:convert';

class BookModel {
  final int id;
  final String title;
  final String author;
  final String coverUrl;
  final String downloadUrl;
  bool favorite;
  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.downloadUrl,
    this.favorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'cover_url': coverUrl,
      'download_url': downloadUrl,
      'favorite': favorite,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      author: map['author'] ?? '',
      coverUrl: map['cover_url'] ?? '',
      downloadUrl: map['download_url'] ?? '',
      favorite: map['favorite'] == 1 ? true : false,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) =>
      BookModel.fromMap(json.decode(source));

  BookModel copyWith({
    int? id,
    String? title,
    String? author,
    String? coverUrl,
    String? downloadUrl,
    bool? favorite,
  }) {
    return BookModel(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      coverUrl: coverUrl ?? this.coverUrl,
      downloadUrl: downloadUrl ?? this.downloadUrl,
      favorite: favorite ?? this.favorite,
    );
  }

  @override
  String toString() {
    return 'BookModel(id: $id, title: $title, author: $author, coverUrl: $coverUrl, downloadUrl: $downloadUrl, favorite: $favorite)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookModel &&
        other.id == id &&
        other.title == title &&
        other.author == author &&
        other.coverUrl == coverUrl &&
        other.downloadUrl == downloadUrl &&
        other.favorite == favorite;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        author.hashCode ^
        coverUrl.hashCode ^
        downloadUrl.hashCode ^
        favorite.hashCode;
  }
}
