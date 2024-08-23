

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osta/core/helpers/cache_helper.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/data/models/main_service_model.dart';
import 'package:osta/data/models/store_product.dart';
import 'package:osta/logic/store/main_store_cubit/main_store_state.dart';

class MainStoreCubit extends Cubit<MainStoreState> {
  MainStoreCubit() : super(MainStoreInitial());

  List<StoreProductModel> cartProducts = [];
  Map<int,int> cart = {};

  List<MainService> getStoreCategories(BuildContext context) {
    return [
      MainService(serviceId: 1,
          serviceName: 'store',
          // 'order_details.store'.tr(context,),
          serviceLogo: ''),
      MainService(serviceId: 2,
          serviceName:'lab',
          // 'order_details.lab'.tr(context,),
          serviceLogo: ''),
      MainService(serviceId: 3,
          serviceName:'company',
          // 'order_details.company'.tr(context),
          serviceLogo: ''),
      MainService(serviceId: 4,
          serviceName:'warehouse',
          // 'store.warehouse'.tr(context),
          serviceLogo: ''),
      MainService(serviceId: 5,
          serviceName:'exhibition',
          // 'store.exhibition'.tr(context),
          serviceLogo: ''),

    ];
  }

  Future<void> addToCart(StoreProductModel product) async{
    cartProducts = CacheHelper.getListData(key: 'cartProducts')?.map((e) => StoreProductModel.fromJson(jsonDecode(e))).toList() ?? [];
 if(CacheHelper.getStringData(key: 'cartProductQuantity') != null) {
   Map<String, int> cartmap = Map<String, int>.from(
       jsonDecode(CacheHelper.getStringData(key: 'cartProductQuantity')!));
   cart = cartmap.map((key, value) => MapEntry(int.parse(key), value));
 }
    if(cartProducts.contains(product)){
      // cartProducts.singleWhere((element) => element.prodId==product.prodId).count + 1;
      increaseQuantity(product);
    }
    else {
      cartProducts.add(product);
      // cart.putIfAbsent(product.prodId, () => 1);
      cart[product.prodId] = 1 ;
    }
  await CacheHelper.saveData(key: 'cartProducts', value: cartProducts.map((e) => jsonEncode(e.toJson())).toList());
    await CacheHelper.saveData(key: 'cartProductQuantity', value: jsonEncode(cart.map((key, value) => MapEntry(key.toString(), value))));
  emit(AddedToCartState(cartProducts: cartProducts));
  }

  void increaseQuantity(StoreProductModel prod)async{

    cart.update(prod.prodId, (value) => value+1);
    // await CacheHelper.saveData(key: 'cartProducts', value: cartProducts.map((e) => jsonEncode(e.toJson())).toList());
   print(cart);
    // await CacheHelper.saveData(key: 'cartProductQuantity', value: jsonEncode(cart));
    await CacheHelper.saveData(key: 'cartProductQuantity', value: jsonEncode(cart.map((key, value) => MapEntry(key.toString(), value))));
    emit(QuantityIncreaseState());
  }

  void decreaseQuantity(StoreProductModel prod) async{
    print(cart[prod.prodId]);
    if(
    cart[prod.prodId]! > 1 )
      cart.update(prod.prodId, (value) => value-1);
   // await CacheHelper.saveData(key: 'cartProductQuantity', value: jsonEncode(cart));
    await CacheHelper.saveData(key: 'cartProductQuantity', value: jsonEncode(cart.map((key, value) => MapEntry(key.toString(), value))));
    emit(QuantityDecreaseState());
  }

  Future<void> removeFromCart(StoreProductModel product) async{
    cartProducts = CacheHelper.getListData(key: 'cartProducts')?.map((e) => StoreProductModel.fromJson(jsonDecode(e))).toList() ?? [];
    if(CacheHelper.getStringData(key: 'cartProductQuantity') != null) {
      Map<String, int> cartmap = Map<String, int>.from(
          jsonDecode(CacheHelper.getStringData(key: 'cartProductQuantity')!));
      cart = cartmap.map((key, value) => MapEntry(int.parse(key), value));
    }
    cartProducts.removeWhere((element)=>element.prodId == product.prodId);
    cart.remove(product.prodId);
  await CacheHelper.saveData(key: 'cartProducts', value: cartProducts.map((e) => jsonEncode(e.toJson())).toList());
    await CacheHelper.saveData(key: 'cartProductQuantity', value: jsonEncode(cart.map((key, value) => MapEntry(key.toString(), value))));
    // await CacheHelper.saveData(key: 'cartProductQuantity', value: jsonEncode(cart));
  emit(RemovedFromCartState());
  }

  Future<void> getCartProducts()async{
    cartProducts = CacheHelper.getListData(key: 'cartProducts')?.map((e) => StoreProductModel.fromJson(jsonDecode(e))).toList() ?? [];
    if(CacheHelper.getStringData(key: 'cartProductQuantity') != null) {
      Map<String, int> cartmap = Map<String, int>.from(
          jsonDecode(CacheHelper.getStringData(key: 'cartProductQuantity')!));
      cart = cartmap.map((key, value) => MapEntry(int.parse(key), value));
    }  }

}
