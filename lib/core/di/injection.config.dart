// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:ssc_invoice_app/core/database/isar_service.dart' as _i3;
import 'package:ssc_invoice_app/features/invoice/data/repositories/invoice_local_data_source_impl.dart'
    as _i5;
import 'package:ssc_invoice_app/features/invoice/data/repositories/invoice_repository_impl.dart'
    as _i7;
import 'package:ssc_invoice_app/features/invoice/domain/repositories/invoice_local_data_source.dart'
    as _i4;
import 'package:ssc_invoice_app/features/invoice/domain/repositories/invoice_repository.dart'
    as _i6;
import 'package:ssc_invoice_app/features/invoice/domain/usecases/delete_invoice.dart'
    as _i9;
import 'package:ssc_invoice_app/features/invoice/domain/usecases/get_all_invoices.dart'
    as _i10;
import 'package:ssc_invoice_app/features/invoice/domain/usecases/get_invoice.dart'
    as _i11;
import 'package:ssc_invoice_app/features/invoice/domain/usecases/save_invoice.dart'
    as _i8;
import 'package:ssc_invoice_app/features/invoice/presentation/cubit/invoice_form/invoice_form_cubit.dart'
    as _i12;
import 'package:ssc_invoice_app/features/invoice/presentation/cubit/invoice_list/invoice_list_cubit.dart'
    as _i13;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.IsarService>(() => _i3.IsarService());
    gh.lazySingleton<_i4.InvoiceLocalDataSource>(
        () => _i5.InvoiceLocalDataSourceImpl(gh<_i3.IsarService>()));
    gh.lazySingleton<_i6.InvoiceRepository>(
        () => _i7.InvoiceRepositoryImpl(gh<_i4.InvoiceLocalDataSource>()));
    gh.factory<_i8.SaveInvoice>(
        () => _i8.SaveInvoice(gh<_i6.InvoiceRepository>()));
    gh.factory<_i9.DeleteInvoice>(
        () => _i9.DeleteInvoice(gh<_i6.InvoiceRepository>()));
    gh.factory<_i10.GetAllInvoices>(
        () => _i10.GetAllInvoices(gh<_i6.InvoiceRepository>()));
    gh.factory<_i11.GetInvoice>(
        () => _i11.GetInvoice(gh<_i6.InvoiceRepository>()));
    gh.factory<_i12.InvoiceFormCubit>(() => _i12.InvoiceFormCubit(
          gh<_i8.SaveInvoice>(),
          gh<_i11.GetInvoice>(),
          gh<_i9.DeleteInvoice>(),
        ));
    gh.factory<_i13.InvoiceListCubit>(() => _i13.InvoiceListCubit(
          gh<_i10.GetAllInvoices>(),
          gh<_i9.DeleteInvoice>(),
        ));
    return this;
  }
}
