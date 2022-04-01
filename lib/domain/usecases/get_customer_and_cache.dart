import 'package:***REMOVED***/data/repositories/customers_repository.dart';
import 'package:***REMOVED***/domain/entities/customer.dart';
import 'package:***REMOVED***/domain/usecases/usecase.dart';

class GetCustomerAndCache
    implements UseCase<Customer, GetCustomerAndCacheParams> {
  final CustomersRepository customersRepository;

  GetCustomerAndCache(this.customersRepository);

  @override
  Future<Customer> call(params) async {
    try {
      Customer remoteCustomer = await customersRepository
          .getRemoteCustomerBySAP(customerSAP: params.customerSAP);

      customersRepository.setLocalCustomerBySAP(
          customerSAP: params.customerSAP, customer: remoteCustomer);
      customersRepository.setCustomerSyncTime(
          customerSAP: params.customerSAP, dateTime: DateTime.now());
      return remoteCustomer;
    } catch (e) {
      print(e);
      try {
        Customer localCustomer = await customersRepository
            .getLocalCustomerBySAP(customerSAP: params.customerSAP);
        return localCustomer;
      } catch (e) {
        throw Exception('Unable to load that consumer');
      }
    }
  }
}

class GetCustomerAndCacheParams {
  final String customerSAP;
  GetCustomerAndCacheParams({
    required this.customerSAP,
  });
}