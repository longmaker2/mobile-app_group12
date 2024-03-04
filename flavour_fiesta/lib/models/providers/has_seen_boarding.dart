import 'package:flutter_riverpod/flutter_riverpod.dart';

class HasSeenBoarding extends StateNotifier<bool> {
  HasSeenBoarding() : super(false);

  void setHasSeenBoarding() {
    state = true;
  }

}


final hasSeenBoardingProvider = StateNotifierProvider<HasSeenBoarding, bool>((ref) {
  return HasSeenBoarding();
});
