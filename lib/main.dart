import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ssc_invoice_app/core/database/isar_service.dart';
import 'package:ssc_invoice_app/features/invoice/presentation/cubit/invoice_list/invoice_list_cubit.dart';
import 'core/di/injection.dart';
import 'core/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  await getIt<IsarService>().init();
  runApp(
    BlocProvider(
      create: (_) => getIt<InvoiceListCubit>()..loadInvoices(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SSC Faktury',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
