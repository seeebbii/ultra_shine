class PaymentModel {
  int? paymentMethodId;
  String? paymentMethodAr;
  String? paymentMethodEn;
  String? paymentMethodCode;
  bool? isDirectPayment;
  double? serviceCharge;
  double? totalAmount;
  String? currencyIso;
  String? imageUrl;

  PaymentModel(
      {this.paymentMethodId,
        this.paymentMethodAr,
        this.paymentMethodEn,
        this.paymentMethodCode,
        this.isDirectPayment,
        this.serviceCharge,
        this.totalAmount,
        this.currencyIso,
        this.imageUrl});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    paymentMethodId = json['PaymentMethodId'];
    paymentMethodAr = json['PaymentMethodAr'];
    paymentMethodEn = json['PaymentMethodEn'];
    paymentMethodCode = json['PaymentMethodCode'];
    isDirectPayment = json['IsDirectPayment'];
    serviceCharge = json['ServiceCharge'];
    totalAmount = json['TotalAmount'];
    currencyIso = json['CurrencyIso'];
    imageUrl = json['ImageUrl'];
  }




  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PaymentMethodId'] = paymentMethodId;
    data['PaymentMethodAr'] = paymentMethodAr;
    data['PaymentMethodEn'] = paymentMethodEn;
    data['PaymentMethodCode'] = paymentMethodCode;
    data['IsDirectPayment'] = isDirectPayment;
    data['ServiceCharge'] = serviceCharge;
    data['TotalAmount'] = totalAmount;
    data['CurrencyIso'] = currencyIso;
    data['ImageUrl'] = imageUrl;
    return data;
  }
}