class Taxonomy {
  Taxonomy({
    required this.data,
  });
  late final List<Data> data;

  Taxonomy.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.businessId,
    this.shortCode,
    required this.parentId,
    required this.createdBy,
    // this.woocommerceCatId,
    required this.categoryType,
    this.description,
    // this.slug,
    //this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.subCategories,
  });
  late final int id;
  late final String name;
  late final int businessId;
  late final String? shortCode;
  late final int parentId;
  late final int createdBy;
  //late final Null woocommerceCatId;
  late final String categoryType;
  late final String? description;
  //late final Null slug;
  //late final Null deletedAt;
  late final String createdAt;
  late final String updatedAt;
  late final List<SubCategories> subCategories;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    businessId = json['business_id'];
    shortCode = null;
    parentId = json['parent_id'];
    createdBy = json['created_by'];
    // woocommerceCatId = null;
    categoryType = json['category_type'];
    description = json['description'];
    //slug = null;
    //deletedAt = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    subCategories = List.from(json['sub_categories'])
        .map((e) => SubCategories.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['business_id'] = businessId;
    _data['short_code'] = shortCode;
    _data['parent_id'] = parentId;
    _data['created_by'] = createdBy;
    //_data['woocommerce_cat_id'] = woocommerceCatId;
    _data['category_type'] = categoryType;
    _data['description'] = description;
    //_data['slug'] = slug;
    //_data['deleted_at'] = deletedAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['sub_categories'] = subCategories.map((e) => e.toJson()).toList();
    return _data;
  }
}

class SubCategories {
  SubCategories({
    required this.id,
    required this.name,
    required this.businessId,
    required this.shortCode,
    required this.parentId,
    required this.createdBy,
    // this.woocommerceCatId,
    required this.categoryType,
    required this.description,
    // this.slug,
    // this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final int businessId;
  late final String shortCode;
  late final int parentId;
  late final int createdBy;
  //late final Null woocommerceCatId;
  late final String categoryType;
  late final String description;
  //late final Null slug;
  //late final Null deletedAt;
  late final String createdAt;
  late final String updatedAt;

  SubCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    businessId = json['business_id'];
    shortCode = json['short_code'];
    parentId = json['parent_id'];
    createdBy = json['created_by'];
    // woocommerceCatId = null;
    categoryType = json['category_type'];
    description = json['description'];
    // slug = null;
    // deletedAt = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['business_id'] = businessId;
    _data['short_code'] = shortCode;
    _data['parent_id'] = parentId;
    _data['created_by'] = createdBy;
    //_data['woocommerce_cat_id'] = woocommerceCatId;
    _data['category_type'] = categoryType;
    _data['description'] = description;
    //_data['slug'] = slug;
    // _data['deleted_at'] = deletedAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
