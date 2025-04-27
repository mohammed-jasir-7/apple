import 'package:apple/core/api/api_request_queue.dart';
import 'package:apple/core/errors/failure.dart';
import 'package:apple/core/widgets/error_snackbar.dart';
import 'package:apple/injectable.dart';
import 'package:apple/main.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:flutter/rendering.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/products_entity.dart';
import '../../domain/usecases/get_products.dart';

@Injectable()
class HomeProvider extends ChangeNotifier {
  final GetProducts _getProducts;

  ProductsEntity? _products;
  DataEntity? _productDetails;

  //loading state
  bool _isLoading = false;

  HomeProvider(this._getProducts);
  ///getter  for products
  ProductsEntity? get products => _products;
  bool get isLoading => _isLoading;
  DataEntity? get productDetails => _productDetails;
  ///setter for products
  set productDetails(DataEntity? value)=>
      _productDetails = value;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();
    // Simulate a network call to fetch products
    final result = await _getProducts();
    result.fold(
      (failure) {
        if(failure is NetworkFailure){
          // Retry the request if there is a network failure
         
          // Retry the request by adding it to the queue
 getIt<ApiQueue>().addToQueue(FunctionApiRequest(
            id: 'getRecommendedEvents',
            call: () async {
              fetchProducts();
            },
            onError: (e) => debugPrint('Retry failed: $e'),
          ));
        }
        // Handle failure case
        errorSnackBar(
          context: navigatorState.currentState!.context,
          message: failure.errorMessage,
        );
      },
      (products) {
        // Handle success case
        _products = products;
      },
    );
    _isLoading = false;
    notifyListeners();
  }
}
