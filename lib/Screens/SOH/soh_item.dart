import 'package:flutter/material.dart';
import 'package:img_demo_app/Model/SOH/stock_on_hand.dart';
import 'package:img_demo_app/Utilities/constant.dart';

class SOHItem extends StatelessWidget {
  final StockOnHand sohData;
  SOHItem(this.sohData);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        sohData.sku_description,
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
                        'Received Quantity : ' + sohData.quantity.toString(),
                        // subjectList[position],
                        style: kH3FontTextStyleGrey(),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
