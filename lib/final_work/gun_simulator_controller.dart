import 'package:audioplayers/audioplayers.dart';
import 'package:gun_simulator/final_work/gun_simulator_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shake/shake.dart';

var gunSimulatorController =
    StateNotifierProvider.autoDispose<GunSimulatorController, GunState>(
        (ref) => GunSimulatorController(GunState.empty()));

class GunSimulatorController extends StateNotifier<GunState> {
  GunSimulatorController(super.state);

  onAppBuild() {
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      playSound();
    });
  }

  Future playSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource('sounds/pistol.mp3'));
  }
}
