import 'package:dating_demo/all_file/all_file.dart';

extension MapExtend<K, V> on RxMap<K, V>? {

  RxMap<K, V>? update(Map<K, V>? list) {
    if(list.isNullOrEmpty() || this == null)
      return this;

    this!.clear();
    this!.addAll(list!);
    this!.refresh();
    return this;
  }
}

extension RxListExtend<T> on RxList<T>? {

  RxList<T>? update(List<T>? list) {
    if(this == null)
      return this;
    this!.clear();
    this!.addAll(list!);
    // this!.refresh();
    return this;
  }
}

extension ListExtend<T> on List<T>? {

  T? getOrNull(int index) {
    if (this == null) return null;
    if (index < this!.length) return this![index];
    return null;
  }

}

extension MapBasics<K, V> on Map<K, V>? {

  bool isNullOrEmpty() {
    if (this == null || this?.length == 0) return true;
    return false;
  }
}

extension IterableBasics<E> on Iterable<E>? {
  List<T> mapAsList<T>(T f(E e)) => this?.map(f).toList() ?? [];

  bool isNullOrEmpty() {
    if (this == null || this?.length == 0) return true;
    return false;
  }

  Iterable<E> filter(bool Function(E element) conditionMethod) {
    return this?.where(conditionMethod) ?? [];
  }

  E? find(bool Function(E element) conditionMethod) {
    return this.filterAsList(conditionMethod).getOrNull(0);
  }

  List<E> filterAsList(bool Function(E element) conditionMethod) {
    return this.filter(conditionMethod).toList();
  }

  List<E> searchList(String? searchText, String? Function(E element) mapping) {
    return this.filterAsList((element) {
      return (mapping(element)?.unsignedLower()?.contains(searchText?.unsignedLower()??'')??false);
    });
  }

  // use "Nill" to avoid conflict name
  E? firstOrNull() {
    if (this?.length == 0) return null;
    return firstOrElse(() => null as E);
  }

  E? lastOrNull() {
    if (this?.length == 0) return null;
    return lastOrElse(() => null as E);
  }

  E? firstOrElse(E Function() orElse) {
    if (this?.length == 0) return null;
    return this?.firstWhere((_) => true, orElse: orElse);
  }

  E? lastOrElse(E Function() orElse) {
    if (this?.length == 0) return null;
    return this?.lastWhere((_) => true, orElse: orElse);
  }

  Iterable<T>? mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    if (this.isNullOrEmpty()) {
      return null;
    }
    return this!.map((e) => f(e, i++));
  }

  List<U> mapAsListIndexed<U>(
    U Function(E currentValue, int index) transformer,
  ) {
    return mapIndexed(transformer)?.toList() ?? [];
  }
}
