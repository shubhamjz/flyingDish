class Product{
  String inventory_type;
  String make;
  String model;
  String retail_price;
  String serialized_flag;
  String unit_of_measure;
  String sku_id;
  String listing_status;
  String sku_description;
  int qty=0;

  Product({this.inventory_type,this.listing_status,this.make,this.model,this.retail_price,this.serialized_flag,this.sku_description,this.sku_id,this.unit_of_measure,this.qty});

  Product.fromJson(Map<String, dynamic> json) {
    inventory_type = json['inventory_type'];
    make = json['make'];
    model = json['model'];
    retail_price = json['retail_price'];
    serialized_flag = json['serialized_flag'];
    unit_of_measure = json['unit_of_measure'];
    sku_id = json['sku_id'];
    sku_description = json['sku_description'];
    listing_status = json['listing_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inventory_type'] = this.inventory_type;
    data['make'] = this.make;
    data['retail_price'] = this.retail_price;
    data['model'] = this.model;
    data['serialized_flag'] = this.serialized_flag;
    data['unit_of_measure'] = this.unit_of_measure;
    data['sku_id'] = this.sku_id;
    data['sku_description'] = this.sku_description;
    data['listing_status'] = this.listing_status;
    return data;
  }
}