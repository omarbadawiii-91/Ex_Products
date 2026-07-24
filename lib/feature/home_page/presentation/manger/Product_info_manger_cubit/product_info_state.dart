part of 'product_info_cubit.dart';

sealed class ProductInfoState extends Equatable {
  const ProductInfoState();

  @override
  List<Object> get props => [];
}

final class ProductInfoInitial extends ProductInfoState {}

final class ProductInfoLoading extends ProductInfoState {}

final class ProductInfoSuccess extends ProductInfoState {
  final List<Product> product;
  const ProductInfoSuccess(this.product);
  @override
  List<Object> get props => [product];
}
final class ProductInfoError extends ProductInfoState {
  final String message;
  const ProductInfoError(this.message);
  @override
  List<Object> get props => [message];
}