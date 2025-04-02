import 'package:restorable/restorable_valuenotifier.dart';

class PageViewModel {
  PageViewModel();

  RestorableValueNotifier<int> counter = RestorableValueNotifier<int>(0);
  RestorableValueNotifier<int> counter2 = RestorableValueNotifier<int>(5);

  void incrementCounter() {
    counter.value++;
    counter2.value++;
  }

  void dispose() {
    counter.dispose();
    counter2.dispose();
  }
}
