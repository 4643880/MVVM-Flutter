// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      status: json['status'] as int?,
      message: json['message'] as String?,
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      contacts: json['contacts'] == null
          ? null
          : Contacts.fromJson(json['contacts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'customer': instance.customer,
      'contacts': instance.contacts,
    };

Contacts _$ContactsFromJson(Map<String, dynamic> json) => Contacts(
      phone: json['phone'] as String?,
      weblink: json['weblink'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ContactsToJson(Contacts instance) => <String, dynamic>{
      'phone': instance.phone,
      'weblink': instance.weblink,
      'email': instance.email,
    };

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: json['id'] as String?,
      name: json['name'] as String?,
      numberofnotifications: json['numberofnotifications'] as int?,
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'numberofnotifications': instance.numberofnotifications,
    };
