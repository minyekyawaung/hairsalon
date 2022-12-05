class BusinessLocation {
  BusinessLocation({
    required this.data,
  });
  late final List<Data> data;

  BusinessLocation.fromJson(Map<String, dynamic> json) {
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
    required this.businessId,
    required this.locationId,
    required this.name,
    required this.landmark,
    required this.country,
    required this.state,
    required this.city,
    required this.zipCode,
    required this.invoiceSchemeId,
    required this.invoiceLayoutId,
    required this.saleInvoiceLayoutId,
    this.sellingPriceGroupId,
    required this.printReceiptOnInvoice,
    required this.receiptPrinterType,
    this.printerId,
    required this.mobile,
    this.alternateNumber,
    this.email,
    required this.website,
    this.featuredProducts,
    required this.isActive,
    this.customField1,
    this.customField2,
    this.customField3,
    this.customField4,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.paymentMethods,
  });
  late final int id;
  late final int businessId;
  late final String locationId;
  late final String name;
  late final String landmark;
  late final String country;
  late final String state;
  late final String city;
  late final String zipCode;
  late final int invoiceSchemeId;
  late final int invoiceLayoutId;
  late final int saleInvoiceLayoutId;
  late final int? sellingPriceGroupId;
  late final int printReceiptOnInvoice;
  late final String receiptPrinterType;
  late final Null printerId;
  late final String mobile;
  late final Null alternateNumber;
  late final String? email;
  late final String website;
  late final Null featuredProducts;
  late final int isActive;
  late final String? customField1;
  late final Null customField2;
  late final String? customField3;
  late final String? customField4;
  late final Null deletedAt;
  late final String createdAt;
  late final String updatedAt;
  late final List<PaymentMethods> paymentMethods;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessId = json['business_id'];
    locationId = json['location_id'];
    name = json['name'];
    landmark = json['landmark'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    zipCode = json['zip_code'];
    invoiceSchemeId = json['invoice_scheme_id'];
    invoiceLayoutId = json['invoice_layout_id'];
    saleInvoiceLayoutId = json['sale_invoice_layout_id'];
    sellingPriceGroupId = null;
    printReceiptOnInvoice = json['print_receipt_on_invoice'];
    receiptPrinterType = json['receipt_printer_type'];
    printerId = null;
    mobile = json['mobile'];
    alternateNumber = null;
    email = null;
    website = json['website'];
    featuredProducts = null;
    isActive = json['is_active'];
    customField1 = null;
    customField2 = null;
    customField3 = null;
    customField4 = null;
    deletedAt = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    paymentMethods = List.from(json['payment_methods'])
        .map((e) => PaymentMethods.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['business_id'] = businessId;
    _data['location_id'] = locationId;
    _data['name'] = name;
    _data['landmark'] = landmark;
    _data['country'] = country;
    _data['state'] = state;
    _data['city'] = city;
    _data['zip_code'] = zipCode;
    _data['invoice_scheme_id'] = invoiceSchemeId;
    _data['invoice_layout_id'] = invoiceLayoutId;
    _data['sale_invoice_layout_id'] = saleInvoiceLayoutId;
    _data['selling_price_group_id'] = sellingPriceGroupId;
    _data['print_receipt_on_invoice'] = printReceiptOnInvoice;
    _data['receipt_printer_type'] = receiptPrinterType;
    _data['printer_id'] = printerId;
    _data['mobile'] = mobile;
    _data['alternate_number'] = alternateNumber;
    _data['email'] = email;
    _data['website'] = website;
    _data['featured_products'] = featuredProducts;
    _data['is_active'] = isActive;
    _data['custom_field1'] = customField1;
    _data['custom_field2'] = customField2;
    _data['custom_field3'] = customField3;
    _data['custom_field4'] = customField4;
    _data['deleted_at'] = deletedAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['payment_methods'] = paymentMethods.map((e) => e.toJson()).toList();
    return _data;
  }
}

class PaymentMethods {
  PaymentMethods({
    required this.name,
    required this.label,
    this.accountId,
  });
  late final String name;
  late final String label;
  late final Null accountId;

  PaymentMethods.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    label = json['label'];
    accountId = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['label'] = label;
    _data['account_id'] = accountId;
    return _data;
  }
}
