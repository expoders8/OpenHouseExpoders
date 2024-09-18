import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// Toast showing in app
///
class CustomToast {
  FToast? fToast;

// @override
// void initState() {
//     super.initState();
//     fToast = FToast();
//     // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
//     fToast.init(context);
// }

  showToast(context) {
    fToast!.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("This is a Custom Toast"),
        ],
      ),
    );

    fToast!.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );

    // Custom Toast Position
    fToast!.showToast(
        child: toast,
        toastDuration: const Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            top: 16.0,
            left: 16.0,
            child: child,
          );
        });
  }
  // static final CustomToast _singleton = CustomToast._internal();
  // late FToast fToast;

  // factory CustomToast() {
  //   return _singleton;
  // }

  // CustomToast._internal() {
  //   fToast = FToast();
  // }

  // void init(BuildContext context) {
  //   fToast.init(context);
  // }

  // showSuccessToast({required message}) {
  //   fToast.removeCustomToast();
  //   fToast.showToast(
  //       toastDuration: const Duration(seconds: 10),
  //       gravity: ToastGravity.TOP,
  //       child: CustomSuccessToast(
  //         message: message,
  //         onCloseButtonPressed: () {
  //           fToast.removeCustomToast();
  //         },
  //       ));
  // }

  // showErrorToast({required message}) {
  //   fToast.showToast(
  //     toastDuration: const Duration(seconds: 10),
  //     gravity: ToastGravity.TOP,
  //     child: CustomEErrorToast(
  //       message: message,
  //       onCloseButtonPressed: () {},
  //     ),
  //   );
  // }

  // showInfoToast({required String message}) {
  //   SnackBar(
  //     backgroundColor: Colors.black87,
  //     content: Text(message),
  //     behavior: SnackBarBehavior.fixed,
  //     action: SnackBarAction(
  //       label: "close",
  //       textColor: Colors.white,
  //       onPressed: () {},
  //     ),
  //     duration: const Duration(seconds: 6),
  //   );
  // }
}
