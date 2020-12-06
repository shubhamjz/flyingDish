

class CartModel{

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
    }
  }

  void removeProduct(product) {
    int index = cart.indexWhere((i) => i.id == product.id);
    cart[index].qty = 0;
    cart.removeWhere((item) => item.id == product.id);
    calculateTotal();
  }

  void updateProduct(product, qty) {
    int index = cart.indexWhere((i) => i.id == product.id);
    cart[index].qty = qty;
    if (cart[index].qty == 0){
      removeProduct(product);}
    calculateTotal();
  }

  void clearCart() {
    cart.forEach((f) => f.qty = 0);
    cart = [];
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