import 'package:contact/core/models/event_status.dart';
import 'package:flutter/material.dart';

class EventStatusLayout<T> extends StatelessWidget {
  final EventStatus status;
  final Widget onErrorStatus;
  final void Function(String error)? onErrorListener;
  final Widget Function(BuildContext context, T? data) onCompletedStatus;
  final Widget onInitialStatus;
  final Widget onLoadingStatus;
  const EventStatusLayout({
    super.key,
    required this.status,
    required this.onCompletedStatus,
    required this.onErrorStatus,
    required this.onInitialStatus,
    required this.onLoadingStatus,
    this.onErrorListener,
  });

  @override
  Widget build(BuildContext context) {
    if (status is EventError) {
      if (onErrorListener != null) {
        String message = (status as EventError).message;
        onErrorListener!(message);
      }
    }
    if (status is EventCompleted) {
      return StreamBuilder(
        stream: Stream.value(status),
        builder: (context, snapShot) {
          T data;
          data = (status as EventCompleted).data;

          return onCompletedStatus(context, data);
        },
      );
    }
    if (status is EventError) {
      return onErrorStatus;
    }
    if (status is EventInitial) {
      return onInitialStatus;
    }
    if (status is EventLoading) {
      return onLoadingStatus;
    }
    return Container();
  }
}
