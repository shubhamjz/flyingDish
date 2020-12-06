import 'package:flutter/services.dart';

const BASE_URL = "http://testdc-env.eba-riedqkne.ca-central-1.elasticbeanstalk.com";

//Get methods
const API_GET_PRODUCT = BASE_URL + "/getShipmentDetails";
const API_GET_SOH_LIST = BASE_URL + "/getStockUpdates";


//Post MethodCall
const API_STO_PRODUCTLIST = BASE_URL + "/getOrderDetail";
const API_UPDATE_RECEIVEDSTATUS = BASE_URL + "/receiveOrder";
const API_PLACED_ORDEFR = BASE_URL + "/createOrder";

