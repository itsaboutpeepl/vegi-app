// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stripe_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StripeAddress _$$_StripeAddressFromJson(Map<String, dynamic> json) =>
    _$_StripeAddress(
      city: json['city'] as String?,
      country: json['country'] as String?,
      line1: json['line1'] as String?,
      line2: json['line2'] as String?,
      postal_code: json['postal_code'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$$_StripeAddressToJson(_$_StripeAddress instance) =>
    <String, dynamic>{
      'city': instance.city,
      'country': instance.country,
      'line1': instance.line1,
      'line2': instance.line2,
      'postal_code': instance.postal_code,
      'state': instance.state,
    };
