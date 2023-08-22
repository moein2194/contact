import 'package:contact/core/models/user_model.dart';
import 'package:flutter/material.dart';

class AppGlobal {
  static final GlobalKey<NavigatorState> navKey =
      GlobalKey<NavigatorState>(debugLabel: 'navigation key');

  static UserModel user = UserModel(email: "",);
}
