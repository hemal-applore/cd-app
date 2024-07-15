import 'package:cd_app/src/app.dart';
import 'package:cd_app/src/providers/distributor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // Add providers here
        ChangeNotifierProvider(
          create: (context) => DistributorProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
