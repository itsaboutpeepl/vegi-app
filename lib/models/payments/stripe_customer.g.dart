// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stripe_customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StripeCustomer _$$_StripeCustomerFromJson(Map<String, dynamic> json) =>
    _$_StripeCustomer(
      id: json['id'] as String,
      address: json['address'] == null
          ? null
          : StripeAddress.fromJson(json['address'] as Map<String, dynamic>),
      balance: json['balance'] as num? ?? 0,
      created: json['created'] as num? ?? 0,
      currency: json['currency'] as String?,
      livemode: json['livemode'] as bool,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      preferred_locals: (json['preferred_locals'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_StripeCustomerToJson(_$_StripeCustomer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address?.toJson(),
      'balance': instance.balance,
      'created': instance.created,
      'currency': instance.currency,
      'livemode': instance.livemode,
      'metadata': instance.metadata,
      'name': instance.name,
      'phone': instance.phone,
      'preferred_locals': instance.preferred_locals,
    };
