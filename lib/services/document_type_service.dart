import 'package:admin/l10n/app_localizations.dart';

/// Service for managing document types with search functionality
class DocumentTypeService {
  static final DocumentTypeService _instance = DocumentTypeService._internal();
  factory DocumentTypeService() => _instance;
  DocumentTypeService._internal();

  /// Comprehensive list of document types with their keys and base pricing
  static const Map<String, DocumentTypeInfo> _documentTypes = {
    // Identity Documents
    'passport_rf': DocumentTypeInfo(
      key: 'passport_rf',
      basePrice: 1500.0,
      category: DocumentCategory.identity,
      searchKeywords: ['passport', 'российский', 'гражданин', 'удостоверение'],
    ),
    'passport_foreign': DocumentTypeInfo(
      key: 'passport_foreign',
      basePrice: 2000.0,
      category: DocumentCategory.identity,
      searchKeywords: ['passport', 'foreign', 'иностранный', 'зарубежный'],
    ),
    'passport_internal': DocumentTypeInfo(
      key: 'passport_internal',
      basePrice: 1200.0,
      category: DocumentCategory.identity,
      searchKeywords: ['internal', 'внутренний', 'паспорт'],
    ),
    'driver_license': DocumentTypeInfo(
      key: 'driver_license',
      basePrice: 1000.0,
      category: DocumentCategory.identity,
      searchKeywords: [
        'driver',
        'license',
        'водительское',
        'удостоверение',
        'права'
      ],
    ),

    // Birth and Civil Status Documents
    'birth_certificate': DocumentTypeInfo(
      key: 'birth_certificate',
      basePrice: 1200.0,
      category: DocumentCategory.civil,
      searchKeywords: ['birth', 'certificate', 'рождение', 'свидетельство'],
    ),
    'marriage_certificate': DocumentTypeInfo(
      key: 'marriage_certificate',
      basePrice: 1200.0,
      category: DocumentCategory.civil,
      searchKeywords: ['marriage', 'certificate', 'брак', 'свидетельство'],
    ),
    'divorce_certificate': DocumentTypeInfo(
      key: 'divorce_certificate',
      basePrice: 1200.0,
      category: DocumentCategory.civil,
      searchKeywords: ['divorce', 'certificate', 'развод', 'свидетельство'],
    ),
    'death_certificate': DocumentTypeInfo(
      key: 'death_certificate',
      basePrice: 1200.0,
      category: DocumentCategory.civil,
      searchKeywords: ['death', 'certificate', 'смерть', 'свидетельство'],
    ),

    // Education Documents
    'diploma_higher': DocumentTypeInfo(
      key: 'diploma_higher',
      basePrice: 2500.0,
      category: DocumentCategory.education,
      searchKeywords: [
        'diploma',
        'higher',
        'education',
        'диплом',
        'высшее',
        'образование'
      ],
    ),
    'diploma_secondary': DocumentTypeInfo(
      key: 'diploma_secondary',
      basePrice: 2000.0,
      category: DocumentCategory.education,
      searchKeywords: ['diploma', 'secondary', 'школа', 'аттестат', 'среднее'],
    ),
    'transcript': DocumentTypeInfo(
      key: 'transcript',
      basePrice: 2000.0,
      category: DocumentCategory.education,
      searchKeywords: ['transcript', 'выписка', 'оценки', 'академическая'],
    ),
    'certificate_course': DocumentTypeInfo(
      key: 'certificate_course',
      basePrice: 1500.0,
      category: DocumentCategory.education,
      searchKeywords: ['certificate', 'course', 'сертификат', 'курсы'],
    ),

    // Medical Documents
    'medical_certificate': DocumentTypeInfo(
      key: 'medical_certificate',
      basePrice: 1800.0,
      category: DocumentCategory.medical,
      searchKeywords: ['medical', 'certificate', 'медицинская', 'справка'],
    ),
    'vaccination_record': DocumentTypeInfo(
      key: 'vaccination_record',
      basePrice: 1500.0,
      category: DocumentCategory.medical,
      searchKeywords: ['vaccination', 'record', 'прививка', 'вакцинация'],
    ),

    // Legal and Business Documents
    'contract': DocumentTypeInfo(
      key: 'contract',
      basePrice: 3000.0,
      category: DocumentCategory.legal,
      searchKeywords: ['contract', 'договор', 'соглашение'],
    ),
    'power_of_attorney': DocumentTypeInfo(
      key: 'power_of_attorney',
      basePrice: 2500.0,
      category: DocumentCategory.legal,
      searchKeywords: ['power', 'attorney', 'доверенность'],
    ),
    'court_decision': DocumentTypeInfo(
      key: 'court_decision',
      basePrice: 3500.0,
      category: DocumentCategory.legal,
      searchKeywords: ['court', 'decision', 'судебное', 'решение'],
    ),
    'apostille': DocumentTypeInfo(
      key: 'apostille',
      basePrice: 1000.0,
      category: DocumentCategory.legal,
      searchKeywords: ['apostille', 'апостиль'],
    ),

    // Financial Documents
    'bank_statement': DocumentTypeInfo(
      key: 'bank_statement',
      basePrice: 1500.0,
      category: DocumentCategory.financial,
      searchKeywords: ['bank', 'statement', 'банковская', 'справка'],
    ),
    'income_certificate': DocumentTypeInfo(
      key: 'income_certificate',
      basePrice: 1500.0,
      category: DocumentCategory.financial,
      searchKeywords: ['income', 'certificate', 'доходы', 'справка'],
    ),

    // Other Documents
    'other': DocumentTypeInfo(
      key: 'other',
      basePrice: 1500.0,
      category: DocumentCategory.other,
      searchKeywords: ['other', 'другое', 'прочее'],
    ),
  };

  /// Search document types by query string
  List<DocumentTypeInfo> searchDocumentTypes(
      String query, AppLocalizations localizations) {
    if (query.isEmpty) {
      return getAllDocumentTypes();
    }

    final lowercaseQuery = query.toLowerCase();
    final results = <DocumentTypeInfo>[];

    for (final docType in _documentTypes.values) {
      // Check if query matches the display name
      final displayName =
          getDocumentTypeDisplayName(docType.key, localizations).toLowerCase();
      if (displayName.contains(lowercaseQuery)) {
        results.add(docType);
        continue;
      }

      // Check if query matches any search keywords
      if (docType.searchKeywords
          .any((keyword) => keyword.toLowerCase().contains(lowercaseQuery))) {
        results.add(docType);
        continue;
      }

      // Check if query matches the key
      if (docType.key.toLowerCase().contains(lowercaseQuery)) {
        results.add(docType);
      }
    }

    // Sort results by relevance (exact matches first, then partial matches)
    results.sort((a, b) {
      final aDisplayName =
          getDocumentTypeDisplayName(a.key, localizations).toLowerCase();
      final bDisplayName =
          getDocumentTypeDisplayName(b.key, localizations).toLowerCase();

      final aExactMatch = aDisplayName == lowercaseQuery;
      final bExactMatch = bDisplayName == lowercaseQuery;

      if (aExactMatch && !bExactMatch) return -1;
      if (!aExactMatch && bExactMatch) return 1;

      return aDisplayName.compareTo(bDisplayName);
    });

    return results;
  }

  /// Get all document types
  List<DocumentTypeInfo> getAllDocumentTypes() {
    return _documentTypes.values.toList();
  }

  /// Get document types by category
  List<DocumentTypeInfo> getDocumentTypesByCategory(DocumentCategory category) {
    return _documentTypes.values
        .where((doc) => doc.category == category)
        .toList();
  }

  /// Get document type info by key
  DocumentTypeInfo? getDocumentTypeInfo(String key) {
    return _documentTypes[key];
  }

  /// Get display name for a document type key
  String getDocumentTypeDisplayName(
      String key, AppLocalizations localizations) {
    switch (key.toLowerCase()) {
      case 'passport_rf':
        return localizations.documentTypePassportRf;
      case 'passport_foreign':
        return localizations.documentTypePassportForeign;
      case 'passport_internal':
        return localizations.documentTypePassportInternal;
      case 'driver_license':
        return localizations.documentTypeDriverLicense;
      case 'birth_certificate':
        return localizations.documentTypeBirthCertificate;
      case 'marriage_certificate':
        return localizations.documentTypeMarriageCertificate;
      case 'divorce_certificate':
        return localizations.documentTypeDivorceCertificate;
      case 'death_certificate':
        return localizations.documentTypeDeathCertificate;
      case 'diploma_higher':
        return localizations.documentTypeDiplomaHigher;
      case 'diploma_secondary':
        return localizations.documentTypeDiplomaSecondary;
      case 'transcript':
        return localizations.documentTypeTranscript;
      case 'certificate_course':
        return localizations.documentTypeCertificateCourse;
      case 'medical_certificate':
        return localizations.documentTypeMedicalCertificate;
      case 'vaccination_record':
        return localizations.documentTypeVaccinationRecord;
      case 'contract':
        return localizations.documentTypeContract;
      case 'power_of_attorney':
        return localizations.documentTypePowerOfAttorney;
      case 'court_decision':
        return localizations.documentTypeCourtDecision;
      case 'apostille':
        return localizations.documentTypeApostille;
      case 'bank_statement':
        return localizations.documentTypeBankStatement;
      case 'income_certificate':
        return localizations.documentTypeIncomeCertificate;
      case 'other':
        return localizations.documentTypeOther;
      default:
        return key; // Return the original key if no localization found
    }
  }

  /// Calculate base price for a document type
  double getBasePrice(String documentTypeKey) {
    final docType = _documentTypes[documentTypeKey];
    return docType?.basePrice ?? 1500.0; // Default price if not found
  }
}

/// Information about a document type
class DocumentTypeInfo {
  final String key;
  final double basePrice;
  final DocumentCategory category;
  final List<String> searchKeywords;

  const DocumentTypeInfo({
    required this.key,
    required this.basePrice,
    required this.category,
    required this.searchKeywords,
  });
}

/// Categories for organizing document types
enum DocumentCategory {
  identity,
  civil,
  education,
  medical,
  legal,
  financial,
  other,
}
