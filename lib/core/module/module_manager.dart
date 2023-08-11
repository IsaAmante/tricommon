import 'package:tricommon/common.dart';
import 'package:flutter/material.dart';

class ModuleManager implements ModuleManagerInterface {
  final Map<String, WidgetBuilder> _routes = {};
  final List<SingleChildWidget> _providers = [];
  final InjectorInterface _injector = InjectorGetIt.instance;
  final List<RouteBase> _goRoutes = [];

  @override
  Map<String, WidgetBuilder> get routes => _routes;
  @override
  List<SingleChildWidget> get providers => _providers;
  @override
  List<RouteBase> get goRoutes => _goRoutes;

  @override
  Future<void> registerModules(List<ModuleInterface> modules) async {
    for (ModuleInterface module in modules) {
      await module.registerRepositories(_injector);
      await module.registerUsecases(_injector);
      if (module.providers(_injector) != null) {
        _providers.addAll(module.providers(_injector)!);
      }
      if (module.routes() != null) {
        _routes.addAll(module.routes()!);
      }
      if (module.goRoutes().isNotEmpty) {
        _goRoutes.addAll(module.goRoutes());
      }
    }
  }
}
