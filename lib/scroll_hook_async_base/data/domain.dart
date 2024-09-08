import 'dart:convert';

import 'package:equatable/equatable.dart';

class ModelResponse extends Equatable {
  final Model data;
  final String message;
  final bool success;
  const ModelResponse({
    required this.data,
    required this.message,
    required this.success,
  });

  factory ModelResponse.init() =>
      ModelResponse(data: Model.init(), message: '', success: false);

  ModelResponse copyWith({
    Model? data,
    String? message,
    bool? success,
  }) {
    return ModelResponse(
      data: data ?? this.data,
      message: message ?? this.message,
      success: success ?? this.success,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.toMap(),
      'message': message,
      'success': success,
    };
  }

  factory ModelResponse.fromMap(Map<String, dynamic> map) {
    return ModelResponse(
      data: Model.fromMap(map['data']),
      message: map['message'] ?? '',
      success: map['success'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelResponse.fromJson(String source) =>
      ModelResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'ModelResponse(data: $data, message: $message, success: $success)';

  @override
  List<Object> get props => [data, message, success];
}

class Model extends Equatable {
  final String id;
  final MerchantInfo merchantInfo;
  final RegularParcelInfo regularParcelInfo;
  final RegularPayment regularPayment;
  final String regularStatus;
  final int merchantUpdate;
  final CustomerInfo customerInfo;
  final List<RegularStatusLog> regularStatusLogs;
  final String serialId;
  final String qrCode;
  final String createdAt;
  final SourceHub sourceHub;
  const Model({
    required this.id,
    required this.merchantInfo,
    required this.regularParcelInfo,
    required this.regularPayment,
    required this.regularStatus,
    required this.merchantUpdate,
    required this.customerInfo,
    required this.regularStatusLogs,
    required this.serialId,
    required this.qrCode,
    required this.createdAt,
    required this.sourceHub,
  });

  factory Model.init() => Model(
      id: '',
      merchantInfo: MerchantInfo.init(),
      regularParcelInfo: RegularParcelInfo.init(),
      regularPayment: RegularPayment.init(),
      regularStatus: '',
      merchantUpdate: 0,
      customerInfo: CustomerInfo.init(),
      regularStatusLogs: const [],
      serialId: '',
      qrCode: '',
      createdAt: '',
      sourceHub: SourceHub.init());

  Model copyWith({
    String? id,
    MerchantInfo? merchantInfo,
    RegularParcelInfo? regularParcelInfo,
    RegularPayment? regularPayment,
    String? regularStatus,
    int? merchantUpdate,
    CustomerInfo? customerInfo,
    List<RegularStatusLog>? regularStatusLogs,
    String? serialId,
    String? qrCode,
    String? createdAt,
    SourceHub? sourceHub,
  }) {
    return Model(
      id: id ?? this.id,
      merchantInfo: merchantInfo ?? this.merchantInfo,
      regularParcelInfo: regularParcelInfo ?? this.regularParcelInfo,
      regularPayment: regularPayment ?? this.regularPayment,
      regularStatus: regularStatus ?? this.regularStatus,
      merchantUpdate: merchantUpdate ?? this.merchantUpdate,
      customerInfo: customerInfo ?? this.customerInfo,
      regularStatusLogs: regularStatusLogs ?? this.regularStatusLogs,
      serialId: serialId ?? this.serialId,
      qrCode: qrCode ?? this.qrCode,
      createdAt: createdAt ?? this.createdAt,
      sourceHub: sourceHub ?? this.sourceHub,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'merchantInfo': merchantInfo.toMap(),
      'regularParcelInfo': regularParcelInfo.toMap(),
      'regularPayment': regularPayment.toMap(),
      'regularStatus': regularStatus,
      'merchantUpdate': merchantUpdate,
      'customerInfo': customerInfo.toMap(),
      'regularStatusLogs': regularStatusLogs.map((x) => x.toMap()).toList(),
      'serialId': serialId,
      'qrCode': qrCode,
      'createdAt': createdAt,
      'sourceHub': sourceHub.toMap(),
    };
  }

  factory Model.fromMap(Map<String, dynamic> map) {
    return Model(
      id: map['_id'] ?? '',
      merchantInfo: MerchantInfo.fromMap(map['merchantInfo']),
      regularParcelInfo: RegularParcelInfo.fromMap(map['regularParcelInfo']),
      regularPayment: RegularPayment.fromMap(map['regularPayment']),
      regularStatus: map['regularStatus'] ?? '',
      merchantUpdate: map['merchantUpdate']?.toInt() ?? 0,
      customerInfo: CustomerInfo.fromMap(map['customerInfo']),
      regularStatusLogs: List<RegularStatusLog>.from(
          map['regularStatusLogs']?.map((x) => RegularStatusLog.fromMap(x)) ??
              const []),
      serialId: map['serialId'] ?? '',
      qrCode: map['qrCode'] ?? '',
      createdAt: map['createdAt'] ?? '',
      sourceHub: SourceHub.fromMap(map['sourceHub']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Model.fromJson(String source) => Model.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(_id: $id, merchantInfo: $merchantInfo, regularParcelInfo: $regularParcelInfo, regularPayment: $regularPayment, regularStatus: $regularStatus, merchantUpdate: $merchantUpdate, customerInfo: $customerInfo, regularStatusLogs: $regularStatusLogs, serialId: $serialId, qrCode: $qrCode, createdAt: $createdAt, sourceHub: $sourceHub)';
  }

  @override
  List<Object> get props {
    return [
      id,
      merchantInfo,
      regularParcelInfo,
      regularPayment,
      regularStatus,
      merchantUpdate,
      customerInfo,
      regularStatusLogs,
      serialId,
      qrCode,
      createdAt,
      sourceHub,
    ];
  }
}

class MerchantInfo extends Equatable {
  final String name;
  final String phone;
  final String address;
  final String shopName;
  final String shopAddress;
  const MerchantInfo({
    required this.name,
    required this.phone,
    required this.address,
    required this.shopName,
    required this.shopAddress,
  });

  factory MerchantInfo.init() => const MerchantInfo(
      name: '', phone: '', address: '', shopName: '', shopAddress: '');

  MerchantInfo copyWith({
    String? name,
    String? phone,
    String? address,
    String? shopName,
    String? shopAddress,
  }) {
    return MerchantInfo(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      shopName: shopName ?? this.shopName,
      shopAddress: shopAddress ?? this.shopAddress,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'shopName': shopName,
      'shopAddress': shopAddress,
    };
  }

  factory MerchantInfo.fromMap(Map<String, dynamic> map) {
    return MerchantInfo(
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
      shopName: map['shopName'] ?? '',
      shopAddress: map['shopAddress'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MerchantInfo.fromJson(String source) =>
      MerchantInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MerchantInfo(name: $name, phone: $phone, address: $address, shopName: $shopName, shopAddress: $shopAddress)';
  }

  @override
  List<Object> get props {
    return [
      name,
      phone,
      address,
      shopName,
      shopAddress,
    ];
  }
}

class RegularParcelInfo extends Equatable {
  final String invoiceId;
  final String weight;
  final int productPrice;
  final String materialType;
  final String category;
  final String details;
  const RegularParcelInfo({
    required this.invoiceId,
    required this.weight,
    required this.productPrice,
    required this.materialType,
    required this.category,
    required this.details,
  });

  factory RegularParcelInfo.init() => const RegularParcelInfo(
      invoiceId: '',
      weight: '',
      productPrice: 0,
      materialType: '',
      category: '',
      details: '');

  RegularParcelInfo copyWith({
    String? invoiceId,
    String? weight,
    int? productPrice,
    String? materialType,
    String? category,
    String? details,
  }) {
    return RegularParcelInfo(
      invoiceId: invoiceId ?? this.invoiceId,
      weight: weight ?? this.weight,
      productPrice: productPrice ?? this.productPrice,
      materialType: materialType ?? this.materialType,
      category: category ?? this.category,
      details: details ?? this.details,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'invoiceId': invoiceId,
      'weight': weight,
      'productPrice': productPrice,
      'materialType': materialType,
      'category': category,
      'details': details,
    };
  }

  factory RegularParcelInfo.fromMap(Map<String, dynamic> map) {
    return RegularParcelInfo(
      invoiceId: map['invoiceId'] ?? '',
      weight: map['weight'] ?? '',
      productPrice: map['productPrice']?.toInt() ?? 0,
      materialType: map['materialType'] ?? '',
      category: map['category'] ?? '',
      details: map['details'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RegularParcelInfo.fromJson(String source) =>
      RegularParcelInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RegularParcelInfo(invoiceId: $invoiceId, weight: $weight, productPrice: $productPrice, materialType: $materialType, category: $category, details: $details)';
  }

  @override
  List<Object> get props {
    return [
      invoiceId,
      weight,
      productPrice,
      materialType,
      category,
      details,
    ];
  }
}

class RegularPayment extends Equatable {
  final int cashCollection;
  final int deliveryCharge;
  final int codCharge;
  final int weightCharge;
  final int totalCharge;
  const RegularPayment({
    required this.cashCollection,
    required this.deliveryCharge,
    required this.codCharge,
    required this.weightCharge,
    required this.totalCharge,
  });

  factory RegularPayment.init() => const RegularPayment(
      cashCollection: 0,
      deliveryCharge: 0,
      codCharge: 0,
      weightCharge: 0,
      totalCharge: 0);

  RegularPayment copyWith({
    int? cashCollection,
    int? deliveryCharge,
    int? codCharge,
    int? weightCharge,
    int? totalCharge,
  }) {
    return RegularPayment(
      cashCollection: cashCollection ?? this.cashCollection,
      deliveryCharge: deliveryCharge ?? this.deliveryCharge,
      codCharge: codCharge ?? this.codCharge,
      weightCharge: weightCharge ?? this.weightCharge,
      totalCharge: totalCharge ?? this.totalCharge,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cashCollection': cashCollection,
      'deliveryCharge': deliveryCharge,
      'codCharge': codCharge,
      'weightCharge': weightCharge,
      'totalCharge': totalCharge,
    };
  }

  factory RegularPayment.fromMap(Map<String, dynamic> map) {
    return RegularPayment(
      cashCollection: map['cashCollection']?.toInt() ?? 0,
      deliveryCharge: map['deliveryCharge']?.toInt() ?? 0,
      codCharge: map['codCharge']?.toInt() ?? 0,
      weightCharge: map['weightCharge']?.toInt() ?? 0,
      totalCharge: map['totalCharge']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegularPayment.fromJson(String source) =>
      RegularPayment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RegularPayment(cashCollection: $cashCollection, deliveryCharge: $deliveryCharge, codCharge: $codCharge, weightCharge: $weightCharge, totalCharge: $totalCharge)';
  }

  @override
  List<Object> get props {
    return [
      cashCollection,
      deliveryCharge,
      codCharge,
      weightCharge,
      totalCharge,
    ];
  }
}

class CustomerInfo extends Equatable {
  final String name;
  final String phone;
  final String address;

  const CustomerInfo({
    required this.name,
    required this.phone,
    required this.address,
  });

  factory CustomerInfo.init() =>
      const CustomerInfo(name: '', phone: '', address: '');

  CustomerInfo copyWith({
    String? name,
    String? phone,
    String? address,
  }) {
    return CustomerInfo(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
    };
  }

  factory CustomerInfo.fromMap(Map<String, dynamic> map) {
    return CustomerInfo(
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerInfo.fromJson(String source) =>
      CustomerInfo.fromMap(json.decode(source));

  @override
  String toString() =>
      'CustomerInfo(name: $name, phone: $phone, address: $address)';

  @override
  List<Object> get props => [name, phone, address];
}

class District extends Equatable {
  final String id;
  final String name;
  const District({
    required this.id,
    required this.name,
  });

  District copyWith({
    String? id,
    String? name,
  }) {
    return District(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
    };
  }

  factory District.fromMap(Map<String, dynamic> map) {
    return District(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory District.fromJson(String source) =>
      District.fromMap(json.decode(source));

  @override
  String toString() => 'District(_id: $id, name: $name)';

  @override
  List<Object> get props => [id, name];
}

class Area extends Equatable {
  final String id;
  final String name;
  const Area({
    required this.id,
    required this.name,
  });

  Area copyWith({
    String? id,
    String? name,
  }) {
    return Area(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
    };
  }

  factory Area.fromMap(Map<String, dynamic> map) {
    return Area(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Area.fromJson(String source) => Area.fromMap(json.decode(source));

  @override
  String toString() => 'Area(_id: $id, name: $name)';

  @override
  List<Object> get props => [id, name];
}

class RegularStatusLog extends Equatable {
  final String time;
  final String id;
  final String log;
  const RegularStatusLog({
    required this.time,
    required this.id,
    required this.log,
  });

  RegularStatusLog copyWith({
    String? time,
    String? id,
    String? log,
  }) {
    return RegularStatusLog(
      time: time ?? this.time,
      id: id ?? this.id,
      log: log ?? this.log,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'time': time,
      '_id': id,
      'log': log,
    };
  }

  factory RegularStatusLog.fromMap(Map<String, dynamic> map) {
    return RegularStatusLog(
      time: map['time'] ?? '',
      id: map['_id'] ?? '',
      log: map['log'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RegularStatusLog.fromJson(String source) =>
      RegularStatusLog.fromMap(json.decode(source));

  @override
  String toString() => 'RegularStatusLog(time: $time, _id: $id, log: $log)';

  @override
  List<Object> get props => [time, id, log];
}

class SourceHub extends Equatable {
  final String id;
  final String serialId;
  final String name;
  const SourceHub({
    required this.id,
    required this.serialId,
    required this.name,
  });

  factory SourceHub.init() => const SourceHub(id: '', serialId: '', name: '');

  SourceHub copyWith({
    String? id,
    String? serialId,
    String? name,
  }) {
    return SourceHub(
      id: id ?? this.id,
      serialId: serialId ?? this.serialId,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'serialId': serialId,
      'name': name,
    };
  }

  factory SourceHub.fromMap(Map<String, dynamic> map) {
    return SourceHub(
      id: map['_id'] ?? '',
      serialId: map['serialId'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SourceHub.fromJson(String source) =>
      SourceHub.fromMap(json.decode(source));

  @override
  String toString() => 'SourceHub(_id: $id, serialId: $serialId, name: $name)';

  @override
  List<Object> get props => [id, serialId, name];
}
