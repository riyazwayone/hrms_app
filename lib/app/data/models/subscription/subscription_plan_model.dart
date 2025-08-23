// class SubscriptionPlanModel {
//   final int id;
//   final String name;
//   final double price;
//   final List<String> features;
//   final List<String> negativeFeatures;
//   final bool isRecommended;
//   final bool isPopular;
//   final int maxShops;
//   final int maxUsers;
//   final String description;

//   SubscriptionPlanModel({
//     required this.id,
//     this.name = '',
//     this.price = 0.0,
//     this.features = const <String>[],
//     this.negativeFeatures = const <String>[],
//     this.isRecommended = false,
//     this.isPopular = false,
//     this.maxShops = 1,
//     this.maxUsers = 5,
//     this.description = '',
//   });

//   factory SubscriptionPlanModel.fromJson(Map<String, dynamic> json) {
//     return SubscriptionPlanModel(
//       id: json['id'] as int,
//       name: json['name'] as String? ?? '',
//       price: (json['price'] as num?)?.toDouble() ?? 0.0,
//       features: (json['features'] as List<dynamic>?)
//               ?.map((e) => e as String)
//               .toList() ??
//           [],
//       negativeFeatures: (json['negative_features'] as List<dynamic>?)
//               ?.map((e) => e as String)
//               .toList() ??
//           [],
//       isRecommended: json['is_recommended'] as bool? ?? false,
//       isPopular: json['is_popular'] as bool? ?? false,
//       maxShops: json['max_shops'] as int? ?? 1,
//       maxUsers: json['max_users'] as int? ?? 5,
//       description: json['description'] as String? ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'price': price,
//       'features': features,
//       'negative_features': negativeFeatures,
//       'is_recommended': isRecommended,
//       'is_popular': isPopular,
//       'max_shops': maxShops,
//       'max_users': maxUsers,
//       'description': description,
//     };
//   }
// }
