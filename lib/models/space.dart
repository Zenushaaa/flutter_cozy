class Space {
  int? id;
  String? name;
  String? city;
  String? country;
  int? price;
  String? imageUrl;
  int? rating;
  String? address;
  String? phoneNumber;
  String? mapUrl;
  List? photos;
  int? numberKitchen;
  int? numberBedroom;
  int? numberCupboards;

  Space({
    this.id,
    this.name,
    this.city,
    this.country,
    this.price,
    this.imageUrl,
    this.rating,
    this.address,
    this.phoneNumber,
    this.mapUrl,
    this.photos,
    this.numberKitchen,
    this.numberBedroom,
    this.numberCupboards,
  });

  Space.fromJson(json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    country = json['country'];
    price = json['price'];
    imageUrl = json['image_url'];
    rating = json['rating'];
    address = json['address'];
    phoneNumber = json['phone'];
    mapUrl = json['map_url'];
    photos = json['photos'];
    numberKitchen = json['number_of_kitchens'];
    numberBedroom = json['number_of_bedrooms'];
    numberCupboards = json['number_of_cupboards'];
  }
}
