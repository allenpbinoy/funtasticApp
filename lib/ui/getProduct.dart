class GetProduct {
  String createdAt;
  String sId;
  String pname;
  String description;
  String price;
  String categories;
  String iV;

  GetProduct(
      {this.createdAt,
      this.sId,
      this.pname,
      this.description,
      this.price,
      this.categories,
      this.iV});

  GetProduct.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    sId = json['_id'];
    pname = json['pname'];
    description = json['description'];
    price = "0";
    categories = json['categories'];
    iV = "0";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['_id'] = this.sId;
    data['pname'] = this.pname;
    data['description'] = this.description;
    data['price'] = this.price;
    data['categories'] = this.categories;
    data['__v'] = this.iV;
    return data;
  }
}
