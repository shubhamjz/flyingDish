import 'package:flutter/material.dart';

class OrderSkuDetails extends StatefulWidget {
  OrderSkuDetails({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _OrderSkuDetailsState createState() => _OrderSkuDetailsState();
}

class _OrderSkuDetailsState extends State<OrderSkuDetails> {
  FocusNode myFocusNode;
  TextEditingController editingController = TextEditingController();

  final duplicateItems = List<String>.generate(10, (i) => "Item $i");
  var items = List<String>();


  @override
  void initState() {
    items.addAll(duplicateItems);
    myFocusNode = FocusNode();
    super.initState();
  }


  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateItems);
    if(query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if(item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title:Text('Do # 8417747649',
          style: TextStyle(color: Colors.black, fontSize: 15.0),
        ),
        actions: [
          // action button
          IconButton(
            icon: Icon( Icons.wysiwyg ),
            onPressed: () {
              Navigator.pushNamed(context, '/receivingsummary');
            },
          ),

        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Center(child: Text('Received / Order Receipt')),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Center(child: Text('887276279992')),
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
                    hintText: "Start Scanning or entered manually",
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
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  // return ListTile(
                  //   title: Text('${items[index]}'),
                  // );
                  return GestureDetector(
                    onTap: () {
                       final snackBar = SnackBar(content: Text("Item${items[index]} Reveived"));
                       Scaffold.of(context).showSnackBar(snackBar);
                      // print(items[index]);

                    },
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                                    child: Text(
                                      'TRK 1Z0MY892020051611',
                                      style: TextStyle(
                                          fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.orange),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                                    child: Text(
                                      'Do # 8417747649',
                                      // subjectList[position],
                                      style: TextStyle(fontSize: 10.0, color: Colors.grey,),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[

                                    Icon(
                                      Icons.done,
                                      size: 25.0,
                                      color: Colors.grey,
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: Text(
                                    //     "Overdue",
                                    //     style: TextStyle(color: Colors.grey, fontSize: 9.0),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 2.0,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
