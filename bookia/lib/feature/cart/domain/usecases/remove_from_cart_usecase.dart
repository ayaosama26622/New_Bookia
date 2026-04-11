import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/cart/data/models/cart_resonse/cart_resonse.dart';
import 'package:bookia/feature/cart/domain/repository/cart_repo.dart';
import 'package:dartz/dartz.dart';

class RemoveFromCartUseCase {
  final CartRepository cartRepository;

  RemoveFromCartUseCase(this.cartRepository);

  Future<Either<Failure, CartResponse>> call(int cartItemId) {
    return cartRepository.removeFromCart(cartItemId);
  }
}