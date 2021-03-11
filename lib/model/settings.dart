class Settings {
  final bool isCelsius;
  final bool isMiles;
  final bool isSoundActive;

  Settings({
    this.isCelsius = true,
    this.isMiles = true,
    this.isSoundActive = true,
  });

  Map<String, dynamic> toJson() => {
        "isCelsius": isCelsius,
        "isMiles": isMiles,
        "isSoundActive": isSoundActive,
      };

  factory Settings.fromJson(Map<String, dynamic> map) => Settings(
        isCelsius: map['isCelsius'],
        isMiles: map['isMiles'],
        isSoundActive: map['isSoundActive'],
      );
}
