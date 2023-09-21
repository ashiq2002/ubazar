import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ubazar/data/network/api_dao.dart';
import 'package:ubazar/data/network/api_services.dart';
import 'package:ubazar/model/category_item_model.dart';
import 'package:ubazar/model/product_model.dart';
import 'package:ubazar/repository/ubazar_base_repository.dart';
import 'package:ubazar/res/strings.dart';

class UbazarRepository extends UbazarBaseRepository{
  final ApiDao _apiDao = ApiServices();

  //getting the all category
   @override
  Future<List<CategoryItemModel>> getCategories() async{
     final List<CategoryItemModel> categories = [];

    try{

      var response = await _apiDao.getApiResponse(categoryUri);
      var data = jsonDecode(response);
      for(Map json in data){
        categories.add(CategoryItemModel.fromJson(json));
      }
      return categories;

    }catch(e){
      debugPrint("failed to retrieve category data-> $e");
      rethrow;
    }
  }

  //get product by category
  @override
  Future<ProductModel> getProductByCategory(String query) async{
    try{

      var response = await _apiDao.getApiResponse(getProductByCategoryUri(query));

      return productModelFromJson(response.toString());

    }catch(e){
      debugPrint("failed to retrieve product data-> $e");
      rethrow;
    }
  }

}