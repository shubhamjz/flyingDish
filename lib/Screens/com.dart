import 'package:flutter/material.dart';
import 'package:img_demo_app/Model/product.dart';
import 'package:img_demo_app/View Model/ECOM/product_view_model.dart';
import 'package:img_demo_app/Screens/COM/product_item.dart';

class Com extends StatefulWidget {
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

  final duplicateItems = List<String>.generate(10, (i) => "TRK1Z0MY89202005161 $i");
  var items = List<String>();
  List<Product> allProductList = List<Product>();
  List<Product> filteredProductList = List<Product>();

  @override
  void initState() {
    items.addAll(duplicateItems);
    myFocusNode = FocusNode();
    super.initState();
    getAcceptedInterviewDetails();
  }

  void getAcceptedInterviewDetails() async{
    ProductViewModel  productViewModel = ProductViewModel();
    final data = await productViewModel.getProductListData();
    setState(() {
      allProductList = data.getJobListFromData();
      filteredProductList = allProductList;
    });
  }

  void filterSearchResults(String searchString) {
    setState(() {
      filteredProductList = allProductList.where((element) => element.make.toLowerCase().contains(searchString.toLowerCase())).toList();
    });

  }
  void grocerySearchResults(String searchString) {
    setState(() {
      filteredProductList = allProductList.where((element) => element.make.toLowerCase().contains(searchString.toLowerCase())).toList();
    });

  }
  void appliancesSearchResults(String searchString) {
    setState(() {
      filteredProductList = allProductList.where((element) => element.make.toLowerCase().contains(searchString.toLowerCase())).toList();
    });

  }
  void veggisSearchResults(String searchString) {
    setState(() {
      filteredProductList = allProductList.where((element) => element.make.toLowerCase().contains(searchString.toLowerCase())).toList();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Place Orders',
          style: TextStyle(color: Colors.black, fontSize: 15.0),
        ),
        actions: [
          // action button
          IconButton(
            icon: Icon( Icons.add_shopping_cart, color: Colors.black,),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),

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
                        setState(() {
                          _allhasBeenPressed  = ! _allhasBeenPressed ;
                        });
                      })
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new RaisedButton(
                        textColor: _grochasBeenPressed ? Colors.white : Colors.orangeAccent,
                        color: _grochasBeenPressed ? Colors.orangeAccent : Colors.white,
                        child: Text("Veggis"),
                        onPressed: () {
                          setState(() {
                            _grochasBeenPressed = !_grochasBeenPressed;
                          });
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new RaisedButton(
                        textColor: _veggieshasBeenPressed ? Colors.white : Colors.orangeAccent,
                        color: _veggieshasBeenPressed ? Colors.orangeAccent : Colors.white,
                        child: Text("Grocery"),
                        onPressed: () {
                          setState(() {
                            _veggieshasBeenPressed = !_veggieshasBeenPressed;
                          });
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new RaisedButton(
                        textColor: _aplanceBeenPressed ? Colors.white : Colors.orangeAccent,
                        color: _aplanceBeenPressed ? Colors.orangeAccent : Colors.white,
                        child: Text("Appliances"),
                        onPressed: () {
                          setState(() {
                            _aplanceBeenPressed = !_aplanceBeenPressed;
                          });
                        }),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20.0,right: 20.0,left: 20,),
              child: TextField(
                focusNode: myFocusNode,
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                style: TextStyle(
                  fontSize: 13.0,
                ),
                decoration: InputDecoration(
                    isDense: true,                      // Added this
                    contentPadding: EdgeInsets.all(0),

                    labelStyle: TextStyle(
                      color: Colors.orangeAccent,
                    ),
                    labelText: "Search",
                    hintText: "search Item ",
                    prefixIcon: Icon(Icons.search,
                      color:  Colors.orangeAccent,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide: BorderSide(
                        color: Colors.orangeAccent,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child:
              ListView.builder(
                shrinkWrap: true,
                itemCount: filteredProductList.length,
                itemBuilder: (context, index)
                => ProductItem(filteredProductList[index])
              ),
            ),
          ],
        ),
      )
    );
  }
}

