class ListProductModelHolder {
  List<ProductModel> list = [];

  ListProductModelHolder.fromJson(List<dynamic> json) {
   list = List<ProductModel>.from(
      json.map((e) {
        ProductModel.fromJson(e);
      }),
    ).toList(); 
  }
}

class ProductModel {
  int? id;
  String? brand;
  String? name;
  String? price;
  String? imageLink;
  String? productLink;
  String? websiteLink;
  String? description;
  double? rating;
  String? productType;
  List<String>? tagList;
  String? createdAt;
  String? updatedAt;
  String? productApiUrl;
  String? apiFeaturedImage;
  List<String>? productColors;

  ProductModel({
    this.id,
    this.brand,
    this.name,
    this.price,
    this.imageLink,
    this.productLink,
    this.websiteLink,
    this.description,
    this.rating,
    this.productType,
    this.tagList,
    this.createdAt,
    this.updatedAt,
    this.productApiUrl,
    this.apiFeaturedImage,
    this.productColors,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    name = json['name'];
    price = json['price'];
    imageLink = json['image_link'];
    productLink = json['product_link'];
    websiteLink = json['website_link'];
    description = json['description'];
    rating = json['rating'];
    productType = json['product_type'];

    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productApiUrl = json['product_api_url'];
    apiFeaturedImage = json['api_featured_image'];
  }
}
