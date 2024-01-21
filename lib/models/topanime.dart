class Topanime{
  String image;
  String title;

  Topanime({required this.image, required this.title});

  factory Topanime.fromJson(Map<String, dynamic> json){
    return Topanime(
      image: json['images']['jpg']['image_url'],
      title: json['titles'].elementAt(0)['title']
      );
  }
}