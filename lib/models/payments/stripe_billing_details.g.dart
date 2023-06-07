// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stripe_billing_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StripeBillingDetails _$$_StripeBillingDetailsFromJson(
        Map<String, dynamic> json) =>
    _$_StripeBillingDetails(
      address: json['address'] == null
          ? null
          : StripeAddress.fromJson(json['address'] as Map<String, dynamic>),
      email: json['email'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$$_StripeBillingDetailsToJson(
        _$_StripeBillingDetails instance) =>
    <String, dynamic>{
      'address': instance.address?.toJson(),
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
    };
