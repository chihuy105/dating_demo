// Helper functions
String enumToString(Object? o) => o.toString().split('.').last;

T? enumFromString<T>(String? key, List<T?> values){
 return values.firstWhere((v) => key == enumToString(v), orElse: () => null);
}
