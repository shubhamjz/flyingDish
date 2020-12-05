class STOObject{
  int unique_id;
  int created_byunique_id;
  int sto_number;
  int quantity;
  int line_item_id;
  int received_quantity;
  String requestor_id;
  String supplier_id;
  String sku_id;
  String status;
  String delivery_method;
  String created_by;
  String last_updated_by;
  String unit_of_measure;
  String created_date;
  String last_updated_date;

  STOObject({this.unit_of_measure,this.sku_id,this.created_by,this.created_date,this.delivery_method,this.last_updated_by,this.last_updated_date,this.line_item_id,this.quantity,this.received_quantity,this.requestor_id,this.status,this.sto_number,this.supplier_id,this.unique_id});

  STOObject.fromJson(Map<String, dynamic> json) {
    unique_id = json['unique_id'];
    sto_number = json['sto_number'];
    quantity = json['quantity'];
    line_item_id = json['line_item_id'];
    received_quantity = json['received_quantity'];
    requestor_id = json['requestor_id'];
    supplier_id = json['supplier_id'];
    sku_id = json['sku_id'];
    status = json['status'];
    delivery_method = json['delivery_method'];
    created_by = json['created_by'];
    last_updated_by = json['last_updated_by'];
    unit_of_measure = json['unit_of_measure'];
    created_date = json['created_date'];
    last_updated_date = json['last_updated_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unique_id'] = this.unique_id;
    data['sto_number'] = this.sto_number;
    data['quantity'] = this.quantity;
    data['line_item_id'] = this.line_item_id;
    data['received_quantity'] = this.received_quantity;
    data['requestor_id'] = this.requestor_id;
    data['supplier_id'] = this.supplier_id;
    data['sku_id'] = this.sku_id;
    data['status'] = this.status;
    data['delivery_method'] = this.delivery_method;
    data['created_by'] = this.created_by;
    data['last_updated_by'] = this.last_updated_by;
    data['unit_of_measure'] = this.unit_of_measure;
    data['created_date'] = this.created_date;
    data['last_updated_date'] = this.last_updated_date;
    return data;
  }

}