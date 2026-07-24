import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/services/apicall.dart';
import 'package:flutter_application_1/feature/home_page/data/product_model/product.dart';

part 'product_info_state.dart';

class ProductInfoCubit extends Cubit<ProductInfoState> {
  ProductInfoCubit() : super(ProductInfoInitial());

  Future <List<Product>?> getProducts() async {
    emit(ProductInfoLoading());
    try{
  List<Product> products = await Apicall().getProducts();
    emit(ProductInfoSuccess(products));
    return products;
    }
    catch(e){
      emit(ProductInfoError(e.toString()));
      return null;
    }

  }
}
