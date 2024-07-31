import 'package:fluent_ui/fluent_ui.dart';

class Status with ChangeNotifier {
  Status({
    this.isLoading = false,
    this.isSaving = false,
    this.isSyncing = false,
    this.isSynced = false,
  });

  bool isLoading;
  bool isSaving;
  bool isSyncing;
  bool isSynced;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void setSaving(bool value) {
    isSaving = value;
  }
}