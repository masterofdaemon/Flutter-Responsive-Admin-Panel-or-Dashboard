import 'package:flutter/material.dart';
import 'package:admin/services/translation_pricing_service.dart';
import 'package:admin/generated/crm.pb.dart' as crm;

/// Widget that displays and calculates translation pricing in real-time
class TranslationPricingWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final pricingService = TranslationPricingService();
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (documentTypeKey == null || documentTypeKey!.isEmpty) {
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
                    'Pricing Calculation',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Please select a document type to see pricing',
                style: TextStyle(color: colorScheme.onSurface.withOpacity(0.6)),
              ),
            ],
          ),
        ),
      );
    }

    final pricing = pricingService.calculatePricing(
      documentTypeKey: documentTypeKey!,
      pageCount: pageCount,
      priority: priority,
      notarialSum: notarialSum,
      cityName: cityName,
      managerLevel: managerLevel,
    );

    // Notify parent about calculated pricing
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onPricingCalculated?.call(pricing.urgentTranslationSum, pricing.totalSum);
    });

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
                  'Pricing Calculation',
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Base price row
        _buildPricingRow(
          'Base Price (per page)',
          '\$${pricing.basePrice.toStringAsFixed(2)}',
          isSubtle: true,
        ),

        // Page count row
        _buildPricingRow(
          'Number of Pages',
          '${pricing.pageCount}',
          isSubtle: true,
        ),

        // Translation sum before urgency
        _buildPricingRow(
          'Translation Sum',
          '\$${pricing.translationSum.toStringAsFixed(2)}',
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
            'Urgent Translation Sum',
            '\$${pricing.urgentTranslationSum.toStringAsFixed(2)}',
            isBold: true,
          ),
        ],

        // Notarial sum (if applicable)
        if (pricing.notarialSum > 0) ...[
          _buildPricingRow(
            'Notarial/Legal Certification',
            '\$${pricing.notarialSum.toStringAsFixed(2)}',
          ),
        ],

        const Divider(thickness: 2),

        // Total sum
        _buildPricingRow(
          'TOTAL',
          '\$${pricing.totalSum.toStringAsFixed(2)}',
          isBold: true,
          isTotal: true,
          color: theme.primaryColor,
        ),

        // Additional info
        if (pricing.cityName != null || pricing.urgencyMultiplier != 1.0) ...[
          const SizedBox(height: 8),
          _buildAdditionalInfo(pricing, context),
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
    final parts = <String>[];

    if (pricing.cityMultiplier != 1.0) {
      parts.add('City: ${pricing.cityMultiplier}x (${pricing.cityName})');
    }

    if (pricing.managerMultiplier != 1.0) {
      parts.add(
          'Manager: ${pricing.managerMultiplier}x (${pricing.managerLevel})');
    }

    return parts.join(' | ');
  }

  String _getUrgencyText(double multiplier) {
    if (multiplier == 2.0) {
      return 'Urgent (+100%)';
    } else if (multiplier == 1.5) {
      return 'Semi-Urgent (+50%)';
    }
    return 'Priority Multiplier';
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

  Widget _buildAdditionalInfo(
      TranslationPricing pricing, BuildContext context) {
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
                'Pricing Information',
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
            _buildInfoText(pricing),
            style:
                TextStyle(fontSize: 12, color: colorScheme.onPrimaryContainer),
          ),
        ],
      ),
    );
  }

  String _buildInfoText(TranslationPricing pricing) {
    final parts = <String>[];

    if (pricing.urgencyMultiplier == 2.0) {
      parts.add('Urgent orders require 100% surcharge');
    } else if (pricing.urgencyMultiplier == 1.5) {
      parts.add('Semi-urgent orders require 50% surcharge');
    }

    if (pricing.cityMultiplier != 1.0) {
      if (pricing.cityMultiplier < 1.0) {
        final discount = ((1.0 - pricing.cityMultiplier) * 100).round();
        parts.add('${pricing.cityName} location provides $discount% discount');
      } else {
        final surcharge = ((pricing.cityMultiplier - 1.0) * 100).round();
        parts.add('${pricing.cityName} location adds $surcharge% surcharge');
      }
    }

    if (parts.isEmpty) {
      parts.add('Standard pricing applies');
    }

    return parts.join('. ');
  }
}
