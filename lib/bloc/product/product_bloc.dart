import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductStateInitial()) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    on<ProductEventAddProduct>((event, emit) async {
      try {
        emit(ProductStateLoading());
        var result = await firestore.collection('products').add({
          'code': event.code,
          'name': event.name,
          'qty': event.qty,
        });

        await firestore.collection('products').doc(result.id).update({
          'productId': result.id,
        });
        emit(ProductStateComplete());
      } on FirebaseException catch (e) {
        emit(
          ProductStateError(e.message ?? 'Tidak dapat menambah product'),
        );
      } catch (e) {
        emit(
          ProductStateError('Tidak dapat menambah product'),
        );
      }
    });
    on<ProductEventEditProduct>((event, emit) {});
    on<ProductEventDeleteProduct>((event, emit) {});
  }
}
