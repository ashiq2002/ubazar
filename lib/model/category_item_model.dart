class CategoryItemModel {
  num? _id;
  String? _name;
  dynamic _description;
  dynamic _parentCategory;
  dynamic _categoryParentId;
  String? _createDate;
  num? _luserId;

  CategoryItemModel({
      num? id,
      String? name,
      dynamic description, 
      dynamic parentCategory, 
      dynamic categoryParentId,
      String? createDate,
      num? luserId,}){
    _id = id;
    _name = name;
    _description = description;
    _parentCategory = parentCategory;
    _categoryParentId = categoryParentId;
    _createDate = createDate;
    _luserId = luserId;
}

  CategoryItemModel.fromJson(dynamic json) {
    _id = json['Id'];
    _name = json['Name'];
    _description = json['Description'];
    _parentCategory = json['ParentCategory'];
    _categoryParentId = json['CategoryParentId'];
    _createDate = json['CreateDate'];
    _luserId = json['LuserId'];
  }

CategoryItemModel copyWith({  num? id,
  String? name,
  dynamic description,
  dynamic parentCategory,
  dynamic categoryParentId,
  String? createDate,
  num? luserId,
}) => CategoryItemModel(  id: id ?? _id,
  name: name ?? _name,
  description: description ?? _description,
  parentCategory: parentCategory ?? _parentCategory,
  categoryParentId: categoryParentId ?? _categoryParentId,
  createDate: createDate ?? _createDate,
  luserId: luserId ?? _luserId,
);
  num? get id => _id;
  String? get name => _name;
  dynamic get description => _description;
  dynamic get parentCategory => _parentCategory;
  dynamic get categoryParentId => _categoryParentId;
  String? get createDate => _createDate;
  num? get luserId => _luserId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['Name'] = _name;
    map['Description'] = _description;
    map['ParentCategory'] = _parentCategory;
    map['CategoryParentId'] = _categoryParentId;
    map['CreateDate'] = _createDate;
    map['LuserId'] = _luserId;
    return map;
  }

}