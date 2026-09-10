class ActionCenterItem {
  final String title;
  final int count;

  ActionCenterItem(this.title, this.count);
}

class AdminActionCenterLogic {
  final List<ActionCenterItem> requests = [
    ActionCenterItem('نیا آرڈر', 3),
    ActionCenterItem('قسط کی ادائیگی', 5),
    ActionCenterItem('لاگ ان درخواستیں', 2),
    ActionCenterItem('سائن اپ درخواستیں', 4),
  ];
}