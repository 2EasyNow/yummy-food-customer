import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../firestore/customer/customer.dart';

class CustomerController extends GetxController {
  StreamSubscription<CustomerDocumentSnapshot>? currentCustomerDocListener;

  Rx<CustomerDocumentSnapshot>? customerDocumentSnapshot;

  String? get currentCustomerId => FirebaseAuth.instance.currentUser?.uid;

  CustomerDocumentReference get currentCustomerReference => customerRef.doc(currentCustomerId);

  Customer? get currentCustomer => customerDocumentSnapshot?.value.data;

  Stream<CustomerDocumentSnapshot> get onCustomerDataChange {
    return currentCustomerReference.snapshots();
  }

  @override
  onInit() {
    super.onInit();
    listenToCustomerDoc();
  }
  Future<bool> get hasCustomerDocCreated async => (await currentCustomerReference.get()).exists;

  Future createCustomerDoc(Customer customer) async {
    await currentCustomerReference.set(customer);
    listenToCustomerDoc();
  }

  listenToCustomerDoc() {
    if (FirebaseAuth.instance.currentUser == null || currentCustomerDocListener != null) return;
    hasCustomerDocCreated.then((value) {
      if (value) {
        currentCustomerDocListener = onCustomerDataChange.listen((snapshot) {
          if (customerDocumentSnapshot == null) {
            customerDocumentSnapshot = snapshot.obs;
          } else {
            customerDocumentSnapshot!.value = snapshot;
          }
        });
      }
    });
  }

  stopCustomerDocListener() {
    currentCustomerDocListener?.cancel();
    customerDocumentSnapshot = null;
  }

  @override
  void onClose() {
    super.onClose();
    if (currentCustomerDocListener != null) currentCustomerDocListener!.cancel();
    customerDocumentSnapshot = null;
  }

}
