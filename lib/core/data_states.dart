abstract class DataState<T> {
  final T? data;
  final String? error;
  final Object? dioError;
  const DataState({this.data, this.error, this.dioError});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailure<T> extends DataState<T> {
  const DataFailure(String error) : super(error: error);
}

class DataFailureDio<T> extends DataState<T> {
  const DataFailureDio(Object error) : super(dioError: error);
}
