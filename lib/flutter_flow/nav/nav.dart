import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const NavBarPage() : const A1SplashScreenWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const NavBarPage() : const A1SplashScreenWidget(),
        ),
        FFRoute(
          name: 'A1SplashScreen',
          path: '/a1SplashScreen',
          builder: (context, params) => const A1SplashScreenWidget(),
        ),
        FFRoute(
          name: 'A2CreateLoginAccount',
          path: '/a2CreateLoginAccount',
          builder: (context, params) => const A2CreateLoginAccountWidget(),
        ),
        FFRoute(
          name: 'A3ForgotPassword',
          path: '/a3ForgotPassword',
          builder: (context, params) => const A3ForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'C1Home',
          path: '/c1Home',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'C1Home')
              : const C1HomeWidget(),
        ),
        FFRoute(
          name: 'C2Dashboard',
          path: '/c2Dashboard',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'C2Dashboard')
              : C2DashboardWidget(
                  projectName: params.getParam(
                    'projectName',
                    ParamType.String,
                  ),
                ),
        ),
        FFRoute(
          name: 'C71Profile',
          path: '/c71Profile',
          builder: (context, params) => const C71ProfileWidget(),
        ),
        FFRoute(
          name: 'C4Notifications',
          path: '/c4Notifications',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'C4Notifications')
              : const C4NotificationsWidget(),
        ),
        FFRoute(
          name: 'C5FileStorage',
          path: '/c5FileStorage',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'C5FileStorage')
              : const C5FileStorageWidget(),
        ),
        FFRoute(
          name: 'A2UserSelection',
          path: '/a2UserSelection',
          builder: (context, params) => const A2UserSelectionWidget(),
        ),
        FFRoute(
          name: 'C7EditProfile',
          path: '/c7EditProfile',
          builder: (context, params) => const C7EditProfileWidget(),
        ),
        FFRoute(
          name: 'C7ChangePassword',
          path: '/c7ChangePassword',
          builder: (context, params) => const C7ChangePasswordWidget(),
        ),
        FFRoute(
          name: 'C7Socials',
          path: '/c7Socials',
          builder: (context, params) => const C7SocialsWidget(),
        ),
        FFRoute(
          name: 'C5InvoiceFolder',
          path: '/c5InvoiceFolder',
          asyncParams: {
            'notificationInvoiceClient':
                getDoc(['notification'], NotificationRecord.fromSnapshot),
          },
          builder: (context, params) => C5InvoiceFolderWidget(
            notificationInvoiceClient: params.getParam(
              'notificationInvoiceClient',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'D1Home',
          path: '/d1Home',
          builder: (context, params) => const D1HomeWidget(),
        ),
        FFRoute(
          name: 'C5AgreementFolder',
          path: '/c5AgreementFolder',
          asyncParams: {
            'notificationAgreementClient':
                getDoc(['notification'], NotificationRecord.fromSnapshot),
          },
          builder: (context, params) => C5AgreementFolderWidget(
            notificationAgreementClient: params.getParam(
              'notificationAgreementClient',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'C5DesignFolder',
          path: '/c5DesignFolder',
          builder: (context, params) => const C5DesignFolderWidget(),
        ),
        FFRoute(
          name: 'D2Dashboard',
          path: '/d2Dashboard',
          builder: (context, params) => D2DashboardWidget(
            projectName: params.getParam(
              'projectName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'D71FileStorage',
          path: '/d71FileStorage',
          builder: (context, params) => const D71FileStorageWidget(),
        ),
        FFRoute(
          name: 'D8DesignFolder',
          path: '/d8DesignFolder',
          builder: (context, params) => const D8DesignFolderWidget(),
        ),
        FFRoute(
          name: 'D8AgreementFolder',
          path: '/d8AgreementFolder',
          builder: (context, params) => const D8AgreementFolderWidget(),
        ),
        FFRoute(
          name: 'D8InvoiceFolder',
          path: '/d8InvoiceFolder',
          builder: (context, params) => const D8InvoiceFolderWidget(),
        ),
        FFRoute(
          name: 'D91ProfileScreen',
          path: '/d91ProfileScreen',
          builder: (context, params) => const D91ProfileScreenWidget(),
        ),
        FFRoute(
          name: 'D9EditProfile',
          path: '/d9EditProfile',
          builder: (context, params) => const D9EditProfileWidget(),
        ),
        FFRoute(
          name: 'D6Notifications',
          path: '/d6Notifications',
          builder: (context, params) => const D6NotificationsWidget(),
        ),
        FFRoute(
          name: 'D9Socials',
          path: '/d9Socials',
          builder: (context, params) => const D9SocialsWidget(),
        ),
        FFRoute(
          name: 'D9ChangePassword',
          path: '/d9ChangePassword',
          builder: (context, params) => const D9ChangePasswordWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/a1SplashScreen';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
