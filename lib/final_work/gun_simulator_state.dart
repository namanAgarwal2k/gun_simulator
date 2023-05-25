import 'dart:ui';

class GunState {
  final bool? isSuccess;
  final bool? isLoading;
  final List<GunModel>? gunsList;
  final bool? isSparkVisible;

  GunState(
      {this.isSuccess, this.isLoading, this.gunsList, this.isSparkVisible});

  factory GunState.empty() {
    return GunState(
      isSuccess: false,
      isLoading: false,
      gunsList: [],
    );
  }

  GunState copyWith({
    bool? isSuccess,
    bool? isLoading,
    List<GunModel>? gunsList,
    bool? isSparkVisible,
  }) {
    return GunState(
      isSuccess: isSuccess ?? this.isSuccess,
      isLoading: isLoading ?? this.isLoading,
      gunsList: gunsList ?? this.gunsList,
      isSparkVisible: isSparkVisible ?? this.isSparkVisible,
    );
  }
}

class GunModel {
  String? gunName;
  String? gunImageUrl;
  String? gunSparkImageUrl;
  int? animationTime;
  Offset? sparkImageOffset;
  int? gunShakeCount;
  double? shakeOffset;

  GunModel(
      this.gunName,
      this.gunImageUrl,
      this.gunSparkImageUrl,
      this.animationTime,
      this.sparkImageOffset,
      this.gunShakeCount,
      this.shakeOffset);
}
