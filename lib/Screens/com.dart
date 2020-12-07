import 'package:flutter/material.dart';
import 'package:img_demo_app/Model/product.dart';
import 'package:img_demo_app/View Model/ECOM/product_view_model.dart';
import 'package:img_demo_app/Screens/COM/product_item.dart';
import'package:img_demo_app/View Model/ECOM/cart_view_model.dart';
import 'package:img_demo_app/Screens/widget/search_bar.dart';
import 'package:img_demo_app/Screens/cart.dart';

class Com extends StatefulWidget {

  CartModel model = CartModel();

  Com ({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ComState createState() => _ComState();
}


class _ComState extends State<Com> {
  bool _allhasBeenPressed = true;
  bool _grochasBeenPressed = false;
  bool _veggieshasBeenPressed = false;
  bool _aplanceBeenPressed = false;
  FocusNode myFocusNode;
  TextEditingController editingController = TextEditingController();

  List<Product> allProductList = List<Product>();
  List<Product> filteredProductList = List<Product>();

  @override
  void initState() {
    myFocusNode = FocusNode();
    super.initState();
    getProductDetails();
  }

  void getProductDetails() async{
    ProductViewModel  productViewModel = ProductViewModel();
    final data = await productViewModel.getProductListData();
    setState(() {
      allProductList = data.getProductListFromData();
      filteredProductList = allProductList;
    });
  }

  void filterSearchResults(String searchString) {
    setState(() {
      filteredProductList = allProductList.where((element) => element.make.toLowerCase().contains(searchString.toLowerCase())).toList();
    });
  }

  void filterByCategory(String searchString) {
    setState(() {
      filteredProductList = allProductList.where((element) => element.inventory_type.toLowerCase().contains(searchString.toLowerCase())).toList();
    });
  }

  void allItem(){

    setState(() {
      filteredProductList = allProductList;
      _allhasBeenPressed = true;
      _grochasBeenPressed = false;
      _veggieshasBeenPressed = false;
      _aplanceBeenPressed = false;
    });
  }
  void grocerySearchResults(String searchString) {
    setState(() {
      filterByCategory(searchString);
     _allhasBeenPressed = false;
    _grochasBeenPressed = true;
    _veggieshasBeenPressed = false;
    _aplanceBeenPressed = false;
    });

  }
  void appliancesSearchResults(String searchString) {
    setState(() {
      filterByCategory(searchString);
      _allhasBeenPressed = false;
      _grochasBeenPressed = false;
      _veggieshasBeenPressed = false;
      _aplanceBeenPressed = true;
    });

  }
  void veggisSearchResults(String searchString) {
    setState(() {
      filterByCategory(searchString);
      _allhasBeenPressed = false;
      _grochasBeenPressed = false;
      _veggieshasBeenPressed = true;
      _aplanceBeenPressed = false;
    });
  }
  @override

  String getCartCount(){
    num sum = 0;
    filteredProductList.forEach((Product e){sum += e.qty;});
    return sum.toString();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
        elevation: 0.0,
        title: Text(
          'Place Order',
          style: TextStyle(color: Colors.white, fontSize: 15.0),
        ),
        actions: [
          Stack(
            children: [
              IconButton(

                icon: Icon(Icons.add_shopping_cart,color: Colors.white,),
                onPressed:() {
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => new CartPage(filteredProductList)));
                  //Navigator.pushNamed(context, '/cart');
                },
              ),
              Positioned(
                top: 0,
                right: 6,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    getCartCount(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          )

        ],
      ),
      body:Container(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                     padding: const EdgeInsets.all(8.0),
                      child: new RaisedButton(
                          textColor:  _allhasBeenPressed ? Colors.white : Colors.orangeAccent,
                          color:  _allhasBeenPressed  ? Colors.orangeAccent : Colors.white,
                          child: Text("All"),
                          onPressed: () {
                            allItem();
                      })
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new RaisedButton(
                        textColor: _veggieshasBeenPressed ? Colors.white : Colors.orangeAccent,
                        color: _veggieshasBeenPressed ? Colors.orangeAccent : Colors.white,
                        child: Text("Appliances"),
                        onPressed: () {
                          veggisSearchResults("Appliances");
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new RaisedButton(
                        textColor: _grochasBeenPressed ? Colors.white : Colors.orangeAccent,
                        color: _grochasBeenPressed ? Colors.orangeAccent : Colors.white,
                        child: Text("Grocery"),
                        onPressed: () {
                          grocerySearchResults("Grocery");
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new RaisedButton(
                        textColor: _aplanceBeenPressed ? Colors.white : Colors.orangeAccent,
                        color: _aplanceBeenPressed ? Colors.orangeAccent : Colors.white,
                        child: Text("Consumable"),
                        onPressed: () {
                          appliancesSearchResults("Consumable");
                        } ),
                  )
                ],
              ),
            ),
            SearchBar(hintText: 'Search by Product',searchTextController: editingController, onTextChanged: (value){
              print(value);
              filterSearchResults(value);
            },),
            Expanded(
              child: filteredProductList.length == 0 ? Text("No Records Found") : ListView.builder(
                shrinkWrap: true,
                itemCount: filteredProductList.length,
                itemBuilder: (context, index) => ProductItem( filteredProductList[index], (value){
                  setState(() {
                    filteredProductList[index].qty = value;
                  });
                 // print(value);
              }),
              ),
            ),
          ],
        ),
      )
    );
  }
}

