 import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

var emailValidate = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

const String stripePublishableKey = 'pk_test_51Io5e6SEA2yMMw8TlswCONDzaYZdOhmC5Yfzr4mC54vN5d20oQL8EnpfCSEKxUCJSyyHsLcCfiz0jwuV80y8EaIa00hOkmcF9r';
const String myFatoorahTestToken = 'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL';
const String myFatoorahTestUrl = 'https://apitest.myfatoorah.com/';

 class CardExpirationFormatter extends TextInputFormatter {
   @override
   TextEditingValue formatEditUpdate(
       TextEditingValue oldValue, TextEditingValue newValue) {
     final newValueString = newValue.text;
     String valueToReturn = '';

     for (int i = 0; i < newValueString.length; i++) {
       if (newValueString[i] != '/') valueToReturn += newValueString[i];
       var nonZeroIndex = i + 1;
       final contains = valueToReturn.contains(RegExp(r'\/'));
       if (nonZeroIndex % 2 == 0 &&
           nonZeroIndex != newValueString.length &&
           !(contains)) {
         valueToReturn += '/';
       }
     }
     return newValue.copyWith(
       text: valueToReturn,
       selection: TextSelection.fromPosition(
         TextPosition(offset: valueToReturn.length),
       ),
     );
   }
 }

 class MaskedTextInputFormatter extends TextInputFormatter {
   final String mask;
   final String separator;

   MaskedTextInputFormatter({
     required this.mask,
     required this.separator,
   });

   @override
   TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
     if(newValue.text.length > 0) {
       if(newValue.text.length > oldValue.text.length) {
         if(newValue.text.length > mask.length) return oldValue;
         if(newValue.text.length < mask.length && mask[newValue.text.length - 1] == separator) {
           return TextEditingValue(
             text: '${oldValue.text}$separator${newValue.text.substring(newValue.text.length-1)}',
             selection: TextSelection.collapsed(
               offset: newValue.selection.end + 1,
             ),
           );
         }
       }
     }
     return newValue;
   }
 }