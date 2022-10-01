T? tryCatchWrap<T>(T Function() callable, {bool throwErr = true}) {
  try {
    return callable();
  } catch (e) {
    if (throwErr) {
      rethrow;
    }
    return null;
  }
}

V pipe<T, V>(T val, V Function(T a) pipeTo) {
  return pipeTo(val);
}

V? pipe_if_exists<T, V>(T? val, V Function(T a) pipeTo) {
  if (val != null) {
    return pipeTo(val);
  } else {
    return null;
  }
}

V? pipe_if_func_exists<T, V>(T val, V Function(T a)? pipeTo) {
  if (pipeTo != null) {
    return pipeTo(val);
  } else {
    return null;
  }
}
