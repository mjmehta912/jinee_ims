class DataDm {
  String? gstNumber;
  String? pCode;
  String? pName;
  String? billNo;
  String? billDate;
  double? valueOfGoods;
  double? gstNetAmount;
  double? cgstAmount;
  double? sgstAmount;
  String? gstin;
  String? invoiceNo;
  String? invoiceDate;
  double? taxableValue;
  double? totalValue;
  double? cgstAmt;
  double? sgstAmt;
  String? category;

  DataDm({
    required this.gstNumber,
    required this.pCode,
    required this.pName,
    required this.billNo,
    required this.billDate,
    required this.valueOfGoods,
    required this.gstNetAmount,
    required this.cgstAmount,
    required this.sgstAmount,
    required this.gstin,
    required this.invoiceNo,
    required this.invoiceDate,
    required this.taxableValue,
    required this.totalValue,
    required this.cgstAmt,
    required this.sgstAmt,
    required this.category,
  });

  factory DataDm.fromJson(Map<String, dynamic> json) {
    return DataDm(
      gstNumber: json['GSTNumber'] ?? '',
      pCode: json['PCODE'] ?? '',
      pName: json['PNAME'] ?? '',
      billNo: json['BILLNO'] ?? '',
      billDate: json['BillDate'] ?? '',
      valueOfGoods: json['ValueOfGoods'] ?? 0.0,
      gstNetAmount: json['GSTNetAmount'] ?? 0.0,
      cgstAmount: json['CGSTAMT'] ?? 0.0,
      sgstAmount: json['SGSTAMT'] ?? 0.0,
      gstin: json['GSTIN'] ?? '',
      invoiceNo: json['INVNO'] ?? '',
      invoiceDate: json['iDT'] ?? '',
      taxableValue: json['TxVal'] ?? 0.0,
      totalValue: json['val'] ?? 0.0,
      cgstAmt: json['CAmt'] ?? 0.0,
      sgstAmt: json['SAmt'] ?? 0.0,
      category: json['Category'] ?? '',
    );
  }
}
