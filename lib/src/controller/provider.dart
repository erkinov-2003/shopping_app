import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';

class MainController extends ChangeNotifier{
  final _cloudStorage = FirebaseFirestore.instance.collection("product");
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