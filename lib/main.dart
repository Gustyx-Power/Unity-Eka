import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/config/env.dart';
import 'core/router/app_router.dart';
import 'core/theme/unika_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 1. Initialize Environment Variables
  await Env.load();

  // 2. Initialize Core Data (Supabase)
  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseAnonKey,
  );

  // 3. Boot Application with State Management Scope
  runApp(const ProviderScope(child: UnikaApp()));
}

class UnikaApp extends ConsumerWidget {
  const UnikaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'UNIKA',
      theme: UnikaThemeData.darkTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
