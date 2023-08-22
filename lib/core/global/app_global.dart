import 'package:contact/core/models/user_model.dart';
import 'package:flutter/material.dart';

class AppGlobal {
  static final GlobalKey<NavigatorState> navKey =
      GlobalKey<NavigatorState>(debugLabel: 'navigation key');

  static UserModel user = UserModel(
    email: "",
  );
  static String appApiKey = "62e3e6d11894fe7edea71921";
}
