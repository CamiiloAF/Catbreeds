import 'dart:convert';

BreedImage breedImageFromJson(Map<String, dynamic> json) =>
    BreedImage.fromJson(json);

String breedImageToJson(BreedImage data) => json.encode(data.toJson());

class BreedImage {
  BreedImage({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  final String id;
  final String url;
  final int width;
  final int height;

  factory BreedImage.fromJson(Map<String, dynamic> json) => BreedImage(
        id: json["id"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "width": width,
        "height": height,
      };
}
