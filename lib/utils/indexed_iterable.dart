import 'dart:core';

extension IterableExtensions<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

extension ListExtensions<E> on List<E> {
  List<E> sortCopy(int Function(E a, E b) f) {
    var res = toList();
    res.sort((a, b) => f(a, b));
    return res;
  }
}
