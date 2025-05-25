import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/services/document_type_service.dart';

/// Service for calculating translation order pricing
class TranslationPricingService {
  static final TranslationPricingService _instance =
      TranslationPricingService._internal();
  factory TranslationPricingService() => _instance;
  TranslationPricingService._internal();

  final DocumentTypeService _documentTypeService = DocumentTypeService();

  /// City-specific pricing multipliers
  static const Map<String, double> _cityMultipliers = {
    'Moscow': 1.0, // Base pricing for Moscow
    'Москва': 1.0, // Russian name for Moscow
    'SPb': 0.9, // St. Petersburg - 10% discount
    'СПб': 0.9, // Russian abbreviation
    'Saint Petersburg': 0.9,
    'Санкт-Петербург': 0.9,
    'Novosibirsk': 0.8, // Regional cities - 20% discount
    'Новосибирск': 0.8,
    'Yekaterinburg': 0.8,
    'Екатеринбург': 0.8,
    'Nizhny Novgorod': 0.8,
    'Нижний Новгород': 0.8,
    'Kazan': 0.8,
    'Казань': 0.8,
    'Chelyabinsk': 0.75, // Smaller cities - 25% discount
    'Челябинск': 0.75,
    'Omsk': 0.75,
    'Омск': 0.75,
    'Samara': 0.75,
    'Самара': 0.75,
    'Rostov-on-Don': 0.75,
    'Ростов-на-Дону': 0.75,
    'Ufa': 0.75,
    'Уфа': 0.75,
    'Krasnoyarsk': 0.75,
    'Красноярск': 0.75,
    'Perm': 0.75,
    'Пермь': 0.75,
    'Voronezh': 0.75,
    'Воронеж': 0.75,
    'Volgograd': 0.75,
    'Волгоград': 0.75,
  };

  /// Manager-specific pricing multipliers (based on experience level)
  static const Map<String, double> _managerMultipliers = {
    'senior': 1.1, // Senior managers can charge 10% more
    'regular': 1.0, // Regular managers use base pricing
    'junior': 0.95, // Junior managers give 5% discount
  };

  /// Calculate total pricing for a translation order
  TranslationPricing calculatePricing({
    required String documentTypeKey,
    int pageCount = 1,
    required crm.Priority priority,
    double notarialSum = 0.0,
    String? cityName,
    String? managerLevel, // 'senior', 'regular', 'junior'
  }) {
    // Get base price from document type
    final basePrice = _documentTypeService.getBasePrice(documentTypeKey);

    // Calculate translation sum before urgency
    double translationSum = basePrice * pageCount;

    // Apply city-specific multiplier
    if (cityName != null && cityName.isNotEmpty) {
      final cityMultiplier = _cityMultipliers[cityName] ?? 1.0;
      translationSum *= cityMultiplier;
    }

    // Apply manager-specific multiplier
    if (managerLevel != null && managerLevel.isNotEmpty) {
      final managerMultiplier = _managerMultipliers[managerLevel] ?? 1.0;
      translationSum *= managerMultiplier;
    }

    // Calculate urgency multiplier and apply to translation sum
    final urgencyMultiplier = _getUrgencyMultiplier(priority);
    final urgentTranslationSum = translationSum * urgencyMultiplier;

    // Calculate total sum
    final totalSum = urgentTranslationSum + notarialSum;

    return TranslationPricing(
      basePrice: basePrice,
      pageCount: pageCount,
      translationSum: translationSum,
      urgencyMultiplier: urgencyMultiplier,
      urgentTranslationSum: urgentTranslationSum,
      notarialSum: notarialSum,
      totalSum: totalSum,
      cityMultiplier:
          cityName != null ? (_cityMultipliers[cityName] ?? 1.0) : 1.0,
      managerMultiplier: managerLevel != null
          ? (_managerMultipliers[managerLevel] ?? 1.0)
          : 1.0,
      cityName: cityName,
      managerLevel: managerLevel,
    );
  }

  /// Get urgency multiplier based on priority
  double _getUrgencyMultiplier(crm.Priority priority) {
    switch (priority) {
      case crm.Priority.URGENT:
        return 2.0; // +100% surcharge
      case crm.Priority.SEMI_URGENT:
        return 1.5; // +50% surcharge
      case crm.Priority.NORMAL:
      case crm.Priority.PRIORITY_UNSPECIFIED:
      default:
        return 1.0; // No surcharge
    }
  }

  /// Get available cities with their multipliers
  Map<String, double> getCityMultipliers() {
    return Map.unmodifiable(_cityMultipliers);
  }

  /// Get available manager levels with their multipliers
  Map<String, double> getManagerMultipliers() {
    return Map.unmodifiable(_managerMultipliers);
  }

  /// Generate 6-digit blank number with validation
  String generateBlankNumber() {
    final now = DateTime.now();
    // Generate a 6-digit number based on timestamp
    // Format: MMDDSS (month, day, seconds within minute)
    final month = now.month.toString().padLeft(2, '0');
    final day = now.day.toString().padLeft(2, '0');
    final seconds = now.second.toString().padLeft(2, '0');
    return '$month$day$seconds';
  }

  /// Validate 6-digit blank number format
  bool isValidBlankNumber(String blankNumber) {
    if (blankNumber.length != 6) return false;
    return RegExp(r'^\d{6}$').hasMatch(blankNumber);
  }

  /// Suggest next blank number based on existing numbers
  String suggestNextBlankNumber(List<String> existingNumbers) {
    if (existingNumbers.isEmpty) {
      return generateBlankNumber();
    }

    // Find the highest number and increment
    final validNumbers = existingNumbers
        .where((num) => isValidBlankNumber(num))
        .map((num) => int.tryParse(num))
        .where((num) => num != null)
        .cast<int>()
        .toList();

    if (validNumbers.isEmpty) {
      return generateBlankNumber();
    }

    validNumbers.sort();
    final nextNumber = validNumbers.last + 1;
    return nextNumber.toString().padLeft(6, '0');
  }
}

/// Result of pricing calculation
class TranslationPricing {
  final double basePrice;
  final int pageCount;
  final double translationSum;
  final double urgencyMultiplier;
  final double urgentTranslationSum;
  final double notarialSum;
  final double totalSum;
  final double cityMultiplier;
  final double managerMultiplier;
  final String? cityName;
  final String? managerLevel;

  const TranslationPricing({
    required this.basePrice,
    required this.pageCount,
    required this.translationSum,
    required this.urgencyMultiplier,
    required this.urgentTranslationSum,
    required this.notarialSum,
    required this.totalSum,
    required this.cityMultiplier,
    required this.managerMultiplier,
    this.cityName,
    this.managerLevel,
  });

  /// Get pricing breakdown as a formatted string
  String getPricingBreakdown() {
    final buffer = StringBuffer();
    buffer.writeln('Base Price: \$${basePrice.toStringAsFixed(2)}');
    buffer.writeln('Pages: $pageCount');
    buffer.writeln('Translation Sum: \$${translationSum.toStringAsFixed(2)}');

    if (cityMultiplier != 1.0) {
      buffer.writeln('City Multiplier ($cityName): ${cityMultiplier}x');
    }

    if (managerMultiplier != 1.0) {
      buffer
          .writeln('Manager Multiplier ($managerLevel): ${managerMultiplier}x');
    }

    if (urgencyMultiplier != 1.0) {
      buffer.writeln('Urgency Multiplier: ${urgencyMultiplier}x');
      buffer.writeln(
          'Urgent Translation Sum: \$${urgentTranslationSum.toStringAsFixed(2)}');
    }

    if (notarialSum > 0) {
      buffer.writeln('Notarial Sum: \$${notarialSum.toStringAsFixed(2)}');
    }

    buffer.writeln('Total Sum: \$${totalSum.toStringAsFixed(2)}');

    return buffer.toString();
  }
}
