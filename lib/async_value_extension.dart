import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension AsyncValueX<T> on AsyncValue<T> {
  /// Extended version of guard function
  /// Return error with previous data in case of exception
  Future<AsyncValue<T>> guardPlus(Future<T> Function() future) async {
    try {
      return AsyncValue.data(await future());
    } catch (err, stack) {
      // Return error with previous data
      return AsyncValue<T>.error(err, stack).copyWithPrevious(this);
    }
  }

  /// Extended version of [when] function
  /// When [skipErrorOnHasValue] is true, skip errors when there is data
  /// Used when displaying retrieved data when an error occurs on the second or subsequent page of paging
  R whenPlus<R>({
    bool skipLoadingOnReload = false,
    bool skipLoadingOnRefresh = true,
    bool skipError = false,
    bool skipErrorOnHasValue = false,
    required R Function(T data, bool hasError) data,
    required R Function(Object error, StackTrace stackTrace) error,
    required R Function() loading,
  }) {
    if (skipErrorOnHasValue) {
      if (hasValue && hasError) {
        return data(requireValue, true);
      }
    }

    return when(
      skipLoadingOnReload: skipLoadingOnReload,
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      skipError: skipError,
      data: (d) => data(d, hasError),
      error: error,
      loading: loading,
    );
  }

  /// Show snackbar on error
  void showSnackbarOnError(
    BuildContext context, {
    String defaultMessage = "An error has occurred",
  }) {
    if (!isLoading && hasError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error!.toString(),
          ),
        ),
      );
    }
  }
}
