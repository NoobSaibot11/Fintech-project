import 'package:flutter/material.dart';
class CourseCart extends ChangeNotifier{
  final List _shopcourse =[
    ["Basic","999.00","Images/basic_plan.png",Colors.grey],
    ["Prime","1999.00","Images/prime_plan.png",Colors.grey],
    ["Holistic","2999.00","Images/holistic_plan.png",Colors.grey],
  ];

  final List _courseCart = [];
  get courseCart => _courseCart;
  get shopcourse => _shopcourse;


  //Add Package to the Cart
  void addPackToCart(int index){
    _courseCart.add(_shopcourse[index]);
    notifyListeners();
  }
  //Remove Package from the Cart
  void deletePackFromCart(int index){
    _courseCart.removeAt(index);
    notifyListeners();
  }

  //Calculate Total Price
  String calculateTotal(){
    double totalPrice=0;
    for(int i=0;i<courseCart.length;i++){
       totalPrice+=double.parse(_courseCart[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}