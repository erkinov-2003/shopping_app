
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/product_model.dart';

class MainController extends ChangeNotifier{
  final _cloudStorage = FirebaseFirestore.instance.collection("product");

  final List<ProductModel> _favoriteList = [];

  List<ProductModel> get favoriteList => _favoriteList;


  final List<ProductModel> _orderList = [];

  List<ProductModel> get orderList => _orderList;


  Future<bool> addSSharedPreferences(String key, String value) async {
    final saveData = await SharedPreferences.getInstance();
    return saveData.setString(key, value);
  }


  void addOrderList(ProductModel productModel){
    _orderList.add(productModel);
    notifyListeners();
  }

  void removeOrderList(ProductModel productModel){
    _orderList.remove(productModel);
    notifyListeners();
  }


  void removeProduct(ProductModel productModel){
    _favoriteList.remove(productModel);
    notifyListeners();
  }

  void addFavoriteList(ProductModel productModel) async{
    _favoriteList.add(productModel);
    notifyListeners();
  }

  Future<void> addProductStorage(ProductModel productModel){
    final cloudStorage =  _cloudStorage.add({
      "title": productModel.title,
      "brends": productModel.brends,
      "price": productModel.price,
      "description": productModel.description,
    });
    return cloudStorage;
  }

  Stream<QuerySnapshot> readProductStorage() {
    final orders = _cloudStorage.orderBy("title", descending: true).snapshots();
    return orders;
  }

  Future<void> updateProductStorage(ProductModel productModel) {
    return _cloudStorage.doc(productModel.toString()).update({
      "title": productModel.title,
      "brends": productModel.brends,
      "price": productModel.price,
      "description": productModel.description,
    });
  }

  Future<void> deleteProductStorage(ProductModel productModel) {
    return _cloudStorage.doc(productModel.title).delete();
  }
}