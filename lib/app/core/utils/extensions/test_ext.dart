// import 'package:nb_utils/nb_utils.dart';

// extension StringLabelFormatter on String {
//   String toLabel() {
//     return replaceAllMapped(RegExp(r'([a-z])([A-Z])'), (match) {
//       return '${match.group(1)} ${match.group(2)}';
//     }).split(' ').map((word) => word.capitalizeFirstLetter()).join(' ');
//   }

//   unitToShort() {
//     return switch (this) {
//       "Square Feet" => "sq ft",
//       "Square Yards" => "sq yd",
//       "Square Yard" => "sq yd",
//       "Square Meters" => "sq m",
//       "Square Meter" => "sq m",
//       "Acres" => "ac",
//       "Hectares" => "ha",
//       _ => this,
//     };
//   }
// }
