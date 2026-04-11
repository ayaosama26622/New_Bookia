import 'package:bookia/core/service/dio/failure.dart';
import 'package:bookia/feature/cart/domain/repository/cart_repo.dart';
import 'package:dartz/dartz.dart';

class CheckoutUseCase {
  final CartRepository cartRepository;

  CheckoutUseCase(this.cartRepository);

  Future<Either<Failure, bool>> call() {
    return cartRepository.checkout();
  }
}