enum Status { initial, loading, success, error }

class BaseState<T> {
  final Status status;
  final T? data;
  final String? errorMessage;

  const BaseState._({
    required this.status,
    this.data,
    this.errorMessage,
  });

  factory BaseState.initial() {
    return BaseState._(status: Status.initial);
  }

  factory BaseState.loading() {
    return BaseState._(status: Status.loading);
  }

  factory BaseState.success(T data) {
    return BaseState._(
      status: Status.success,
      data: data,
    );
  }

  factory BaseState.error(String message) {
    return BaseState._(
      status: Status.error,
      errorMessage: message,
    );
  }

  BaseState<T> copyWith({
    Status? status,
    T? data,
    String? errorMessage,
  }) {
    return BaseState._(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
} 