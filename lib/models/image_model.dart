class ImageModel {
  String? id;
  String? image;
  String? description;

  ImageModel({
    this.id,
    this.image,
    this.description,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      description: json['description'] as String?,
      id: json['id'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id.toString(),
      "image": image.toString(),
      "description": description.toString()
    };
  }
}
