import 'package:scoped_model/scoped_model.dart';

class CartModel extends Model {

  List<CartProduct> cart = [];
  double totalCartValue = 0;

  int get total => cart.length;

  void addProduct(CartProduct product ) {
    print(product);
    int index = cart.indexWhere((i) => i.id == product.id);
    print(index);
    if (index != -1){
      updateProduct(product, product.qty);
      print(cart[1].title);
    }
    else {
      cart.add(product);
      calculateTotal();
      notifyListeners();

    }
    //print(cart.toString());
  }
  void removProduct(CartProduct product ) {
    print(product);
    int index = cart.indexWhere((i) => i.id == product.id);
    print(index);
    if (index != -1){
      updateProduct(product, product.qty);
      print(cart[1].title);
    }
    else {
      cart.remove(product);
      calculateTotal();
      notifyListeners();
    }
  }

  void removeProduct(product) {
    int index = cart.indexWhere((i) => i.id == product.id);
    cart[index].qty = 0;
    cart.removeWhere((item) => item.id == product.id);
    calculateTotal();
    notifyListeners();
  }

  void updateProduct(product, qty) {
    int index = cart.indexWhere((i) => i.id == product.id);
    cart[index].qty = qty;
    if (cart[index].qty == 0){
      removeProduct(product);}
    calculateTotal();
    notifyListeners();
  }

  void clearCart() {
    cart.forEach((f) => f.qty = 0);
    cart = [];
    notifyListeners();
  }

  void calculateTotal() {
    totalCartValue = 0;
    cart.forEach((f) {
      totalCartValue += f.price * f.qty;
    });
  }

}

class CartProduct {
  int id;
  String title;
  double price;
  int qty;

  CartProduct({this.id, this.title, this.price, this.qty,});
}