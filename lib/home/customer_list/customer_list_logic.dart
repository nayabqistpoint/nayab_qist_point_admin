class CustomerModel {
  final String name;
  final String status;
  final String amount;

  CustomerModel(this.name, this.status, this.amount);
}

class CustomerListLogic {
  final List<CustomerModel> customers = [
    CustomerModel('محمد افضل', 'دن لیٹ 15', 'Rs. 35,000'),
    CustomerModel('علی رضا', 'وقت پر', 'Rs. 12,000'),
  ];
}