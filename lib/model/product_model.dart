import 'dart:convert';

/// Success : 1
/// error : false
/// ProductList : [{"Id":106769,"Type":null,"ParentCode":null,"Name":"Boys Polo","Code":"100011GRXL","Price":0.0,"CostPrice":100.0,"UnitName":"PCS","CategoryName":"=N/A=","BrandName":"Frresh","ModelName":"","VariantName":"XL","SizeName":"XL","ColorName":"Green","OldPrice":0.0,"ImagePath":"/Content/ProductImages/106769.png","CommissionAmount":0.0,"CommissionPer":0.0000,"PCTN":0.0000,"ProductBarcode":"100011GRXL","Description":"","ChildList":[],"BatchSerial":[],"WarehouseList":[],"CurrentStock":0.0,"CreateDate":"0001/01/01 12:00:00","UpdateDate":"2023/06/06 12:37:51"},{"Id":106768,"Type":"S","ParentCode":"100011","Name":"Boys Polo","Code":"100011GRL","Price":780.0,"CostPrice":110.0,"UnitName":"PCS","CategoryName":"=N/A=","BrandName":"","ModelName":"","VariantName":"L","SizeName":"L","ColorName":"Green","OldPrice":0.0,"ImagePath":"/Content/ProductImages/106768_100011GRL_Boys Polo_152554111-girl-in-orange-blouse-illustration.jpg","CommissionAmount":0.0,"CommissionPer":0.0000,"PCTN":0.0000,"ProductBarcode":"100011GRL","Description":"","ChildList":[],"BatchSerial":[],"WarehouseList":[],"CurrentStock":0.0,"CreateDate":"2023/02/28 12:58:10","UpdateDate":"2023/08/24 09:16:26"},{"Id":106767,"Type":"S","ParentCode":"100011","Name":"Boys Polo","Code":"100011GRM","Price":90.0,"CostPrice":20.0,"UnitName":"PCS","CategoryName":"=N/A=","BrandName":"","ModelName":"","VariantName":"M","SizeName":"M","ColorName":"Green","OldPrice":90.0,"ImagePath":null,"CommissionAmount":0.0,"CommissionPer":0.0000,"PCTN":0.0000,"ProductBarcode":"100011GRM","Description":"","ChildList":[],"BatchSerial":[],"WarehouseList":[],"CurrentStock":0.0,"CreateDate":"2023/02/28 12:58:10","UpdateDate":"2023/08/24 08:17:04"},{"Id":106766,"Type":"S","ParentCode":"100011","Name":"Boys Polo","Code":"100011OGXL","Price":12.0,"CostPrice":0.0,"UnitName":"PCS","CategoryName":"=N/A=","BrandName":"","ModelName":"","VariantName":"XL","SizeName":"XL","ColorName":"Orange","OldPrice":0.0,"ImagePath":"/Content/ProductImages/106766_100011OGXL_Boys Polo_design salesfunnel with thrive architect.jpg","CommissionAmount":0.0,"CommissionPer":0.0000,"PCTN":0.0000,"ProductBarcode":"100011OGXL","Description":"","ChildList":[],"BatchSerial":[],"WarehouseList":[],"CurrentStock":0.0,"CreateDate":"2023/02/28 12:58:10","UpdateDate":"2023/08/24 08:16:55"},{"Id":106765,"Type":"S","ParentCode":"100011","Name":"Boys Polo","Code":"100011OGL","Price":10.0,"CostPrice":0.0,"UnitName":"PCS","CategoryName":"=N/A=","BrandName":"","ModelName":"","VariantName":"L","SizeName":"L","ColorName":"Orange","OldPrice":0.0,"ImagePath":null,"CommissionAmount":0.0,"CommissionPer":0.0000,"PCTN":0.0000,"ProductBarcode":"100011OGL","Description":"","ChildList":[],"BatchSerial":[],"WarehouseList":[],"CurrentStock":0.0,"CreateDate":"2023/02/28 12:58:10","UpdateDate":"2023/08/24 08:16:39"},{"Id":106764,"Type":"S","ParentCode":"100011","Name":"Boys Polo","Code":"100011OGM","Price":50.0,"CostPrice":0.0,"UnitName":"PCS","CategoryName":"=N/A=","BrandName":"","ModelName":"","VariantName":"M","SizeName":"M","ColorName":"Orange","OldPrice":0.0,"ImagePath":null,"CommissionAmount":0.0,"CommissionPer":0.0000,"PCTN":0.0000,"ProductBarcode":"100011OGM","Description":"","ChildList":[],"BatchSerial":[],"WarehouseList":[],"CurrentStock":0.0,"CreateDate":"2023/02/28 12:58:10","UpdateDate":"2023/08/24 08:16:31"},{"Id":106763,"Type":"C","ParentCode":null,"Name":"Boys Polo","Code":"100011","Price":150.0,"CostPrice":120.0,"UnitName":"PCS","CategoryName":"=N/A=","BrandName":"","ModelName":"","VariantName":"","SizeName":"","ColorName":"","OldPrice":0.0,"ImagePath":null,"CommissionAmount":0.0,"CommissionPer":0.0000,"PCTN":0.0000,"ProductBarcode":"100011","Description":"","ChildList":[[106764],[106765],[106766],[106767],[106768]],"BatchSerial":[],"WarehouseList":[],"CurrentStock":0.0,"CreateDate":"2023/02/28 12:58:08","UpdateDate":"2023/08/24 09:16:26"},{"Id":2128,"Type":"S","ParentCode":null,"Name":"BIG BOYS BOXER ML.","Code":"100002165","Price":105.0,"CostPrice":94.0,"UnitName":"PCS","CategoryName":"=N/A=","BrandName":"","ModelName":"","VariantName":"","SizeName":"","ColorName":"","OldPrice":0.0,"ImagePath":"/Content/ProductImages/","CommissionAmount":0.0,"CommissionPer":0.0000,"PCTN":0.0000,"ProductBarcode":"100002165","Description":"","ChildList":[],"BatchSerial":[],"WarehouseList":[],"CurrentStock":0.0,"CreateDate":"2021/05/01 05:21:03","UpdateDate":"2021/05/01 05:21:03"}]
/// PageInfo : {"PageNo":1,"PageSize":10,"PageCount":1,"TotalRecordCount":8}

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));
String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    num? success,
    bool? error,
    List<ProductList>? productList,
    PageInfo? pageInfo,
  }) {
    _success = success;
    _error = error;
    _productList = productList;
    _pageInfo = pageInfo;
  }

  ProductModel.fromJson(dynamic json) {
    _success = json['Success'];
    _error = json['error'];
    if (json['ProductList'] != null) {
      _productList = [];
      json['ProductList'].forEach((v) {
        _productList?.add(ProductList.fromJson(v));
      });
    }
    _pageInfo =
        json['PageInfo'] != null ? PageInfo.fromJson(json['PageInfo']) : null;
  }
  num? _success;
  bool? _error;
  List<ProductList>? _productList;
  PageInfo? _pageInfo;
  ProductModel copyWith({
    num? success,
    bool? error,
    List<ProductList>? productList,
    PageInfo? pageInfo,
  }) =>
      ProductModel(
        success: success ?? _success,
        error: error ?? _error,
        productList: productList ?? _productList,
        pageInfo: pageInfo ?? _pageInfo,
      );
  num? get success => _success;
  bool? get error => _error;
  List<ProductList>? get productList => _productList;
  PageInfo? get pageInfo => _pageInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Success'] = _success;
    map['error'] = _error;
    if (_productList != null) {
      map['ProductList'] = _productList?.map((v) => v.toJson()).toList();
    }
    if (_pageInfo != null) {
      map['PageInfo'] = _pageInfo?.toJson();
    }
    return map;
  }
}

/// PageNo : 1
/// PageSize : 10
/// PageCount : 1
/// TotalRecordCount : 8

PageInfo pageInfoFromJson(String str) => PageInfo.fromJson(json.decode(str));
String pageInfoToJson(PageInfo data) => json.encode(data.toJson());

class PageInfo {
  PageInfo({
    num? pageNo,
    num? pageSize,
    num? pageCount,
    num? totalRecordCount,
  }) {
    _pageNo = pageNo;
    _pageSize = pageSize;
    _pageCount = pageCount;
    _totalRecordCount = totalRecordCount;
  }

  PageInfo.fromJson(dynamic json) {
    _pageNo = json['PageNo'];
    _pageSize = json['PageSize'];
    _pageCount = json['PageCount'];
    _totalRecordCount = json['TotalRecordCount'];
  }
  num? _pageNo;
  num? _pageSize;
  num? _pageCount;
  num? _totalRecordCount;
  PageInfo copyWith({
    num? pageNo,
    num? pageSize,
    num? pageCount,
    num? totalRecordCount,
  }) =>
      PageInfo(
        pageNo: pageNo ?? _pageNo,
        pageSize: pageSize ?? _pageSize,
        pageCount: pageCount ?? _pageCount,
        totalRecordCount: totalRecordCount ?? _totalRecordCount,
      );
  num? get pageNo => _pageNo;
  num? get pageSize => _pageSize;
  num? get pageCount => _pageCount;
  num? get totalRecordCount => _totalRecordCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PageNo'] = _pageNo;
    map['PageSize'] = _pageSize;
    map['PageCount'] = _pageCount;
    map['TotalRecordCount'] = _totalRecordCount;
    return map;
  }
}

/// Id : 106769
/// Type : null
/// ParentCode : null
/// Name : "Boys Polo"
/// Code : "100011GRXL"
/// Price : 0.0
/// CostPrice : 100.0
/// UnitName : "PCS"
/// CategoryName : "=N/A="
/// BrandName : "Frresh"
/// ModelName : ""
/// VariantName : "XL"
/// SizeName : "XL"
/// ColorName : "Green"
/// OldPrice : 0.0
/// ImagePath : "/Content/ProductImages/106769.png"
/// CommissionAmount : 0.0
/// CommissionPer : 0.0000
/// PCTN : 0.0000
/// ProductBarcode : "100011GRXL"
/// Description : ""
/// ChildList : []
/// BatchSerial : []
/// WarehouseList : []
/// CurrentStock : 0.0
/// CreateDate : "0001/01/01 12:00:00"
/// UpdateDate : "2023/06/06 12:37:51"

ProductList productListFromJson(String str) =>
    ProductList.fromJson(json.decode(str));
String productListToJson(ProductList data) => json.encode(data.toJson());

class ProductList {
  ProductList({
    num? id,
    dynamic type,
    dynamic parentCode,
    String? name,
    String? code,
    num? price,
    num? costPrice,
    String? unitName,
    String? categoryName,
    String? brandName,
    String? modelName,
    String? variantName,
    String? sizeName,
    String? colorName,
    num? oldPrice,
    String? imagePath,
    num? commissionAmount,
    num? commissionPer,
    num? pctn,
    String? productBarcode,
    String? description,
    num? currentStock,
    String? createDate,
    String? updateDate,
  }) {
    _id = id;
    _type = type;
    _parentCode = parentCode;
    _name = name;
    _code = code;
    _price = price;
    _costPrice = costPrice;
    _unitName = unitName;
    _categoryName = categoryName;
    _brandName = brandName;
    _modelName = modelName;
    _variantName = variantName;
    _sizeName = sizeName;
    _colorName = colorName;
    _oldPrice = oldPrice;
    _imagePath = imagePath;
    _commissionAmount = commissionAmount;
    _commissionPer = commissionPer;
    _pctn = pctn;
    _productBarcode = productBarcode;
    _description = description;
    _currentStock = currentStock;
    _createDate = createDate;
    _updateDate = updateDate;
  }

  ProductList.fromJson(dynamic json) {
    _id = json['Id'];
    _type = json['Type'];
    _parentCode = json['ParentCode'];
    _name = json['Name'];
    _code = json['Code'];
    _price = json['Price'];
    _costPrice = json['CostPrice'];
    _unitName = json['UnitName'];
    _categoryName = json['CategoryName'];
    _brandName = json['BrandName'];
    _modelName = json['ModelName'];
    _variantName = json['VariantName'];
    _sizeName = json['SizeName'];
    _colorName = json['ColorName'];
    _oldPrice = json['OldPrice'];
    _imagePath = json['ImagePath'];
    _commissionAmount = json['CommissionAmount'];
    _commissionPer = json['CommissionPer'];
    _pctn = json['PCTN'];
    _productBarcode = json['ProductBarcode'];
    _description = json['Description'];
    _currentStock = json['CurrentStock'];
    _createDate = json['CreateDate'];
    _updateDate = json['UpdateDate'];
  }
  num? _id;
  dynamic _type;
  dynamic _parentCode;
  String? _name;
  String? _code;
  num? _price;
  num? _costPrice;
  String? _unitName;
  String? _categoryName;
  String? _brandName;
  String? _modelName;
  String? _variantName;
  String? _sizeName;
  String? _colorName;
  num? _oldPrice;
  String? _imagePath;
  num? _commissionAmount;
  num? _commissionPer;
  num? _pctn;
  String? _productBarcode;
  String? _description;
  num? _currentStock;
  String? _createDate;
  String? _updateDate;
  ProductList copyWith({
    num? id,
    dynamic type,
    dynamic parentCode,
    String? name,
    String? code,
    num? price,
    num? costPrice,
    String? unitName,
    String? categoryName,
    String? brandName,
    String? modelName,
    String? variantName,
    String? sizeName,
    String? colorName,
    num? oldPrice,
    String? imagePath,
    num? commissionAmount,
    num? commissionPer,
    num? pctn,
    String? productBarcode,
    String? description,
    num? currentStock,
    String? createDate,
    String? updateDate,
  }) =>
      ProductList(
        id: id ?? _id,
        type: type ?? _type,
        parentCode: parentCode ?? _parentCode,
        name: name ?? _name,
        code: code ?? _code,
        price: price ?? _price,
        costPrice: costPrice ?? _costPrice,
        unitName: unitName ?? _unitName,
        categoryName: categoryName ?? _categoryName,
        brandName: brandName ?? _brandName,
        modelName: modelName ?? _modelName,
        variantName: variantName ?? _variantName,
        sizeName: sizeName ?? _sizeName,
        colorName: colorName ?? _colorName,
        oldPrice: oldPrice ?? _oldPrice,
        imagePath: imagePath ?? _imagePath,
        commissionAmount: commissionAmount ?? _commissionAmount,
        commissionPer: commissionPer ?? _commissionPer,
        pctn: pctn ?? _pctn,
        productBarcode: productBarcode ?? _productBarcode,
        description: description ?? _description,
        currentStock: currentStock ?? _currentStock,
        createDate: createDate ?? _createDate,
        updateDate: updateDate ?? _updateDate,
      );
  num? get id => _id;
  dynamic get type => _type;
  dynamic get parentCode => _parentCode;
  String? get name => _name;
  String? get code => _code;
  num? get price => _price;
  num? get costPrice => _costPrice;
  String? get unitName => _unitName;
  String? get categoryName => _categoryName;
  String? get brandName => _brandName;
  String? get modelName => _modelName;
  String? get variantName => _variantName;
  String? get sizeName => _sizeName;
  String? get colorName => _colorName;
  num? get oldPrice => _oldPrice;
  String? get imagePath => _imagePath;
  num? get commissionAmount => _commissionAmount;
  num? get commissionPer => _commissionPer;
  num? get pctn => _pctn;
  String? get productBarcode => _productBarcode;
  String? get description => _description;
  num? get currentStock => _currentStock;
  String? get createDate => _createDate;
  String? get updateDate => _updateDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['Type'] = _type;
    map['ParentCode'] = _parentCode;
    map['Name'] = _name;
    map['Code'] = _code;
    map['Price'] = _price;
    map['CostPrice'] = _costPrice;
    map['UnitName'] = _unitName;
    map['CategoryName'] = _categoryName;
    map['BrandName'] = _brandName;
    map['ModelName'] = _modelName;
    map['VariantName'] = _variantName;
    map['SizeName'] = _sizeName;
    map['ColorName'] = _colorName;
    map['OldPrice'] = _oldPrice;
    map['ImagePath'] = _imagePath;
    map['CommissionAmount'] = _commissionAmount;
    map['CommissionPer'] = _commissionPer;
    map['PCTN'] = _pctn;
    map['ProductBarcode'] = _productBarcode;
    map['Description'] = _description;
    map['CurrentStock'] = _currentStock;
    map['CreateDate'] = _createDate;
    map['UpdateDate'] = _updateDate;
    return map;
  }
}
