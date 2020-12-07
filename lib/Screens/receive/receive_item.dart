import 'package:flutter/material.dart';
import 'package:img_demo_app/Model/Receive/order_object.dart';
import 'package:img_demo_app/Screens/receive/orderdetails.dart';
import 'package:img_demo_app/Utilities/utilities.dart';

class ReceiveItem extends StatelessWidget {
  final OrderObject orderData;
  ReceiveItem(this.orderData);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, '/orderdetails');
        Navigator.push(context, new MaterialPageRoute(builder: (context) => new OrderDetails(orderData)));
      },
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(5),
        ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'STO No : ' + orderData.sto_number.toString(),
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.orange),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Status : FullFilled",
                            style: TextStyle(color: Colors.grey, fontSize: 16.0),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 20,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Colors.white60,
                ),
              )
            ],
          ),
      ),
    );
  }
}
