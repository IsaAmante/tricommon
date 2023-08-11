import 'package:tricommon/common.dart';
import 'package:flutter/material.dart';

abstract class ModuleManagerInterface {
  Future<void> registerModules(List<ModuleInterface> modules);
  Map<String, WidgetBuilder> get routes;
  List<SingleChildWidget> get providers;
  List<RouteBase> get goRoutes;
}
