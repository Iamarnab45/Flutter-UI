import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'route/app_router.dart';
import 'provider/auth_provider.dart';
import 'provider/post_provider.dart';
import 'repository/mock_api_client.dart';
import 'repository/api_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiClient = MockApiClient();
    
    return MultiProvider(
      providers: [
        Provider<ApiClient>(
          create: (_) => apiClient,
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(apiClient: apiClient),
        ),
        ChangeNotifierProxyProvider<ApiClient, PostProvider>(
          create: (context) => PostProvider(context.read<ApiClient>()),
          update: (context, apiClient, previous) => 
            previous ?? PostProvider(apiClient),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: goRouter,
        title: 'Alumni Management System',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
      ),
    );
  }
}
