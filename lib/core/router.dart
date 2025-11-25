import 'package:go_router/go_router.dart';
import '../features/invoice/presentation/pages/invoice_list_page.dart';
import '../features/invoice/presentation/pages/invoice_form_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const InvoiceListPage(),
    ),
    GoRoute(
      path: '/form',
      builder: (context, state) {
        final editId = state.uri.queryParameters['id'];
        return InvoiceFormPage(invoiceId: editId);
      },
    ),
  ],
);
