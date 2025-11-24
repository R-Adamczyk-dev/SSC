enum VatRate { zero, seven, twentyThree }

extension VatRateExtension on VatRate {
  double get rate => switch (this) {
        VatRate.zero => 0.0,
        VatRate.seven => 0.07,
        VatRate.twentyThree => 0.23,
      };

  String get displayName => switch (this) {
        VatRate.zero => '0%',
        VatRate.seven => '7%',
        VatRate.twentyThree => '23%',
      };
}