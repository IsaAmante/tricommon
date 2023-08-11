import 'dart:async';

import 'package:tricommon/common.dart';
import 'package:flutter/material.dart';

abstract class ModuleInterface {
  Map<String, WidgetBuilder>? routes();
  List<RouteBase> goRoutes();
  List<SingleChildWidget>? providers(InjectorInterface injector);
  Future<void> registerRepositories(InjectorInterface injector);
  Future<void> registerUsecases(InjectorInterface injector);
}
