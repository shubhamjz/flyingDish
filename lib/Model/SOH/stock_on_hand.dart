class StockOnHand{
  String store_id;
  String sku_id;
  String sku_description;
  int quantity;

  StockOnHand({this.store_id,this.sku_id,this.sku_description,this.quantity});

  StockOnHand.fromJson(Map<String, dynamic> json) {
    store_id = json['store_id'];
    sku_id = json['sku_id'];
    sku_description = json['sku_description'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_id'] = this.store_id;
    data['sku_id'] = this.sku_id;
    data['sku_description'] = this.sku_description;
    data['quantity'] = this.quantity;
    return data;
  }
}