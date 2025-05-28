import 'package:flutter/material.dart';
import 'package:admin/services/translation_pricing_service.dart';
import 'package:admin/generated/crm.pb.dart' as crm;
import 'package:admin/l10n/app_localizations.dart';

/// Widget that displays and calculates translation pricing in real-time
class TranslationPricingWidget extends StatefulWidget {
  final String? documentTypeKey;
  final int pageCount;
  final crm.Priority priority;
  final double notarialSum;
  final String? cityName;
  final String? managerLevel;
  final Function(double translationSum, double totalSum)? onPricingCalculated;

  const TranslationPricingWidget({
    super.key,
    this.documentTypeKey,
    this.pageCount = 1,
    this.priority = crm.Priority.NORMAL,
    this.notarialSum = 0.0,
    this.cityName,
    this.managerLevel,
    this.onPricingCalculated,
  });

  @override
  State<TranslationPricingWidget> createState() =>
      _TranslationPricingWidgetState();
}

class _TranslationPricingWidgetState extends State<TranslationPricingWidget> {
  TranslationPricing? _lastPricing;

  @override
  void initState() {
    super.initState();
    _calculateAndNotify();
  }

  @override
  void didUpdateWidget(TranslationPricingWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if any pricing-relevant parameters changed
    if (oldWidget.documentTypeKey != widget.documentTypeKey ||
        oldWidget.pageCount != widget.pageCount ||
        oldWidget.priority != widget.priority ||
        oldWidget.notarialSum != widget.notarialSum ||
        oldWidget.cityName != widget.cityName ||
        oldWidget.managerLevel != widget.managerLevel) {
      _calculateAndNotify();
    }
  }

  void _calculateAndNotify() {
    if (widget.documentTypeKey == null || widget.documentTypeKey!.isEmpty) {
      return;
    }

    final pricingService = TranslationPricingService();
    final pricing = pricingService.calculatePricing(
      documentTypeKey: widget.documentTypeKey!,
      pageCount: widget.pageCount,
      priority: widget.priority,
      notarialSum: widget.notarialSum,
      cityName: widget.cityName,
      managerLevel: widget.managerLevel,
    );

    _lastPricing = pricing;

    // Notify parent about calculated pricing
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        widget.onPricingCalculated
            ?.call(pricing.urgentTranslationSum, pricing.totalSum);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final localizations = AppLocalizations.of(context);

    if (widget.documentTypeKey == null || widget.documentTypeKey!.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.calculate, color: colorScheme.primary),
                  const SizedBox(width: 8),
                  Text(
                    localizations.translationPricingCalculationTitle,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                localizations.translationPricingSelectDocumentTypeMessage,
                style: TextStyle(color: colorScheme.onSurface.withOpacity(0.6)),
              ),
            ],
          ),
        ),
      );
    }

    final pricing = _lastPricing;
    if (pricing == null) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.calculate, color: colorScheme.primary),
                  const SizedBox(width: 8),
                  Text(
                    localizations.translationPricingCalculationTitle,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                localizations.translationPricingCalculatingMessage,
                style: TextStyle(color: colorScheme.onSurface.withOpacity(0.6)),
              ),
            ],
          ),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.calculate, color: colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  localizations.translationPricingCalculationTitle,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildPricingBreakdown(context, pricing),
          ],
        ),
      ),
    );
  }

  Widget _buildPricingBreakdown(
      BuildContext context, TranslationPricing pricing) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Base price row
        _buildPricingRow(
          localizations.translationPricingBasePriceLabel,
          '${localizations.currencySymbolRuble}${pricing.basePrice.toStringAsFixed(2)}',
          isSubtle: true,
        ),

        // Page count row
        _buildPricingRow(
          localizations.translationPricingNumberOfPagesLabel,
          '${pricing.pageCount}',
          isSubtle: true,
        ),

        // Translation sum before urgency
        _buildPricingRow(
          localizations.translationPricingTranslationSumLabel,
          '${localizations.currencySymbolRuble}${pricing.translationSum.toStringAsFixed(2)}',
          subtitle:
              pricing.cityMultiplier != 1.0 || pricing.managerMultiplier != 1.0
                  ? _buildMultiplierText(pricing)
                  : null,
        ),

        // Urgency multiplier (if applicable)
        if (pricing.urgencyMultiplier != 1.0) ...[
          _buildPricingRow(
            _getUrgencyText(pricing.urgencyMultiplier),
            '${pricing.urgencyMultiplier}x',
            color: _getUrgencyColor(pricing.urgencyMultiplier, context),
          ),
          _buildPricingRow(
            localizations.translationPricingUrgentTranslationSumLabel,
            '${localizations.currencySymbolRuble}${pricing.urgentTranslationSum.toStringAsFixed(2)}',
            isBold: true,
          ),
        ],

        // Notarial sum (if applicable)
        if (pricing.notarialSum > 0) ...[
          _buildPricingRow(
            localizations.translationPricingNotarialSumLabel,
            '${localizations.currencySymbolRuble}${pricing.notarialSum.toStringAsFixed(2)}',
          ),
        ],

        const Divider(thickness: 2),

        // Total sum
        _buildPricingRow(
          localizations.translationPricingTotalLabel,
          '${localizations.currencySymbolRuble}${pricing.totalSum.toStringAsFixed(2)}',
          isBold: true,
          isTotal: true,
          color: theme.primaryColor,
        ),

        // Additional info
        if (pricing.cityName != null || pricing.urgencyMultiplier != 1.0) ...[
          const SizedBox(height: 8),
          _buildAdditionalInfo(pricing, context, localizations),
        ],
      ],
    );
  }

  Widget _buildPricingRow(
    String label,
    String value, {
    String? subtitle,
    bool isBold = false,
    bool isTotal = false,
    bool isSubtle = false,
    Color? color,
  }) {
    return Builder(builder: (context) {
      final theme = Theme.of(context);
      final colorScheme = theme.colorScheme;

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontWeight: isBold || isTotal
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontSize: isTotal ? 16 : 14,
                      color: isSubtle
                          ? colorScheme.onSurface.withOpacity(0.6)
                          : (color ?? colorScheme.onSurface),
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                ],
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontWeight:
                    isBold || isTotal ? FontWeight.bold : FontWeight.normal,
                fontSize: isTotal ? 16 : 14,
                color: color ?? colorScheme.onSurface,
              ),
            ),
          ],
        ),
      );
    });
  }

  String _buildMultiplierText(TranslationPricing pricing) {
    final localizations = AppLocalizations.of(context);
    final parts = <String>[];

    if (pricing.cityMultiplier != 1.0) {
      parts.add(localizations.translationPricingCityMultiplierText(
          pricing.cityMultiplier, pricing.cityName ?? ''));
    }

    if (pricing.managerMultiplier != 1.0) {
      parts.add(localizations.translationPricingManagerMultiplierText(
          pricing.managerMultiplier, pricing.managerLevel ?? ''));
    }

    return parts.join(' | ');
  }

  String _getUrgencyText(double multiplier) {
    final localizations = AppLocalizations.of(context);
    if (multiplier == 2.0) {
      return localizations.translationPricingUrgentSurcharge;
    } else if (multiplier == 1.5) {
      return localizations.translationPricingSemiUrgentSurcharge;
    }
    return localizations.translationPricingPriorityMultiplier;
  }

  Color _getUrgencyColor(double multiplier, BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    if (multiplier == 2.0) {
      return colorScheme.error;
    } else if (multiplier == 1.5) {
      return Colors.orange;
    }
    return colorScheme.primary;
  }

  Widget _buildAdditionalInfo(TranslationPricing pricing, BuildContext context,
      AppLocalizations localizations) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: colorScheme.primary.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, size: 16, color: colorScheme.primary),
              const SizedBox(width: 4),
              Text(
                localizations.translationPricingInformationTitle,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            _buildInfoText(pricing, localizations),
            style:
                TextStyle(fontSize: 12, color: colorScheme.onPrimaryContainer),
          ),
        ],
      ),
    );
  }

  String _buildInfoText(
      TranslationPricing pricing, AppLocalizations localizations) {
    final parts = <String>[];

    if (pricing.urgencyMultiplier == 2.0) {
      parts.add(localizations.translationPricingUrgentSurchargeInfo);
    } else if (pricing.urgencyMultiplier == 1.5) {
      parts.add(localizations.translationPricingSemiUrgentSurchargeInfo);
    }

    if (pricing.cityMultiplier != 1.0) {
      if (pricing.cityMultiplier < 1.0) {
        final discount = ((1.0 - pricing.cityMultiplier) * 100).round();
        parts.add(localizations.translationPricingLocationDiscountInfo(
            pricing.cityName ?? '', discount));
      } else {
        final surcharge = ((pricing.cityMultiplier - 1.0) * 100).round();
        parts.add(localizations.translationPricingLocationSurchargeInfo(
            pricing.cityName ?? '', surcharge));
      }
    }

    if (parts.isEmpty) {
      parts.add(localizations.translationPricingStandardPricing);
    }

    return parts.join('. ');
  }
}
