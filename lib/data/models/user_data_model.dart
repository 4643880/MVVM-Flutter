import 'package:json_annotation/json_annotation.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
part 'user_data_model.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "customer")
  Customer? customer;
  @JsonKey(name: "contacts")
  Contacts? contacts;

  User({
    this.status,
    this.message,
    this.customer,
    this.contacts,
  });

  User copyWith({
    int? status,
    String? message,
    Customer? customer,
    Contacts? contacts,
  }) =>
      User(
        status: status ?? this.status,
        message: message ?? this.message,
        customer: customer ?? this.customer,
        contacts: contacts ?? this.contacts,
      );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Contacts {
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "weblink")
  String? weblink;
  @JsonKey(name: "email")
  String? email;

  Contacts({
    this.phone,
    this.weblink,
    this.email,
  });

  Contacts copyWith({
    String? phone,
    String? weblink,
    String? email,
  }) =>
      Contacts(
        phone: phone ?? this.phone,
        weblink: weblink ?? this.weblink,
        email: email ?? this.email,
      );

  factory Contacts.fromJson(Map<String, dynamic> json) =>
      _$ContactsFromJson(json);

  Map<String, dynamic> toJson() => _$ContactsToJson(this);
}

@JsonSerializable()
class Customer {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "numberofnotifications")
  int? numberofnotifications;

  Customer({
    this.id,
    this.name,
    this.numberofnotifications,
  });

  Customer copyWith({
    String? id,
    String? name,
    int? numberofnotifications,
  }) =>
      Customer(
        id: id ?? this.id,
        name: name ?? this.name,
        numberofnotifications:
            numberofnotifications ?? this.numberofnotifications,
      );

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
