import 'package:contact/core/models/event_status.dart';
import 'package:flutter/material.dart';

class EventStatusLayout extends StatelessWidget {
  final EventStatus status;
  final Widget onErrorStatus;
  final Widget Function(BuildContext context, dynamic data) onCompletedStatus;
  final Widget onInitialStatus;
  final Widget onLoadingStatus;
  const EventStatusLayout({
    super.key,
    required this.status,
    required this.onCompletedStatus,
    required this.onErrorStatus,
    required this.onInitialStatus,
    required this.onLoadingStatus,
  });

  @override
  Widget build(BuildContext context) {
    if (status is EventCompleted) {
      return StreamBuilder(
        builder: (context, snapshot) {
          dynamic data;
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
