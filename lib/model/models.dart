class CurrencyConvert {
  final String from;
  final String to;
  final double amount;
  final double result;

  CurrencyConvert({
    required this.result,
    required this.amount,
    required this.from,
    required this.to
  });

  factory CurrencyConvert.fromMap({required Map data})
  {
    return CurrencyConvert(result: data["result"],
        amount: data["query"]["amount"],
        from: data["query"]["from"],
        to: data["query"]["to"],);
  }
}
