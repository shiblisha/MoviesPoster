class MovieModel {
  MovieModel({
      this.rank, 
      this.title, 
      this.thumbnail, 
      this.rating, 
      this.id, 
      this.year, 
      this.image, 
      this.description, 
      this.trailer, 
      this.genre, 
      this.director, 
      this.writers, 
      this.imdbid,});

  MovieModel.fromJson(dynamic json) {
    rank = json['rank'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    rating = json['rating'];
    id = json['id'];
    year = json['year'];
    image = json['image'];
    description = json['description'];
    trailer = json['trailer'];
    genre = json['genre'] != null ? json['genre'].cast<String>() : [];
    director = json['director'] != null ? json['director'].cast<String>() : [];
    writers = json['writers'] != null ? json['writers'].cast<String>() : [];
    imdbid = json['imdbid'];
  }
  int? rank;
  String? title;
  String? thumbnail;
  String? rating;
  String? id;
  int? year;
  String? image;
  String? description;
  String? trailer;
  List<String>? genre;
  List<String>? director;
  List<String>? writers;
  String? imdbid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rank'] = rank;
    map['title'] = title;
    map['thumbnail'] = thumbnail;
    map['rating'] = rating;
    map['id'] = id;
    map['year'] = year;
    map['image'] = image;
    map['description'] = description;
    map['trailer'] = trailer;
    map['genre'] = genre;
    map['director'] = director;
    map['writers'] = writers;
    map['imdbid'] = imdbid;
    return map;
  }

  static List<MovieModel> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => MovieModel.fromJson(value)).toList();
  }
}