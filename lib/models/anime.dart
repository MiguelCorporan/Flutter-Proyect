

class Anime {
  String image;
  String title;
  int id;
  String status;
  String sipnosis;

  Anime({required this.image,
   required this.title,
    required this.id,
     required this.status,
      required this.sipnosis });


  factory Anime.fromJson(Map<String, dynamic> json){
    return Anime(image: json['images']['jpg']['image_url'],
     title: json['titles'].elementAt(0)['title'],
     id: json['mal_id'],
     status: json['status'],
     sipnosis: json['synopsis']);
  }
}