import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin/constants.dart';
import 'package:admin/models/notification_model.dart';
import 'package:admin/services/notification_service.dart';
import 'package:admin/l10n/app_localizations.dart';

class NotificationsPanel extends StatefulWidget {
  const NotificationsPanel({super.key});

  @override
  State<NotificationsPanel> createState() => _NotificationsPanelState();
}

class _NotificationsPanelState extends State<NotificationsPanel> {
  bool _showUnreadOnly = false;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.2),
        ),
      ),
      child: Column(
        children: [
          _buildHeader(context, localizations),
          Expanded(
            child: _buildNotificationsList(context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, AppLocalizations? localizations) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.2),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Hide content when width is too narrow to prevent overflow during animation
          if (constraints.maxWidth < 250) {
            return const SizedBox.shrink();
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.notifications,
                    color: primaryColor,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      localizations?.notificationsTitle ?? 'Notifications',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Consumer<NotificationService>(
                    builder: (context, notificationService, child) {
                      final unreadCount = notificationService.unreadCount;
                      if (unreadCount > 0) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            unreadCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: _showUnreadOnly,
                          onChanged: (value) {
                            setState(() {
                              _showUnreadOnly = value ?? false;
                            });
                          },
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                        Flexible(
                          child: Text(
                            localizations?.notificationsUnreadOnly ??
                                'Unread only',
                            style: const TextStyle(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: TextButton(
                      onPressed: () {
                        context.read<NotificationService>().markAllAsRead();
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        localizations?.notificationsMarkAllRead ??
                            'Mark All as Read',
                        style: TextStyle(
                          fontSize: 12,
                          color: primaryColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildNotificationsList(BuildContext context) {
    return Consumer<NotificationService>(
      builder: (context, notificationService, child) {
        return FutureBuilder<List<AppNotification>>(
          future: notificationService.getNotifications(
            unreadOnly: _showUnreadOnly,
            limit: 50,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return _buildLoadingState();
            }

            if (snapshot.hasError) {
              return _buildErrorState(context);
            }

            final notifications = snapshot.data ?? [];

            if (notifications.isEmpty) {
              return _buildEmptyState(context);
            }

            return RefreshIndicator(
              onRefresh: () => notificationService.refresh(),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: notifications.length,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return _buildNotificationItem(context, notification);
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildNotificationItem(
      BuildContext context, AppNotification notification) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: notification.isRead ? Colors.white : Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: notification.isUrgent
              ? Colors.red.shade300
              : notification.isHighPriority
                  ? Colors.orange.shade300
                  : Colors.transparent,
          width: notification.isUrgent || notification.isHighPriority ? 1 : 0,
        ),
      ),
      child: InkWell(
        onTap: () => _handleNotificationTap(context, notification),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNotificationIcon(notification),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                notification.title,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: notification.isRead
                                      ? FontWeight.normal
                                      : FontWeight.w600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (notification.isUrgent) ...[
                              const SizedBox(width: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 1,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Text(
                                  'URGENT',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          notification.message,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Text(
                              notification.formattedTime,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            const Spacer(),
                            if (!notification.isRead)
                              Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 4),
                  PopupMenuButton<String>(
                    icon: Icon(
                      Icons.more_vert,
                      size: 16,
                      color: Colors.grey.shade600,
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'read',
                        child: Row(
                          children: [
                            Icon(
                              notification.isRead
                                  ? Icons.mark_email_unread
                                  : Icons.mark_email_read,
                              size: 16,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              notification.isRead
                                  ? 'Mark as Unread'
                                  : 'Mark as Read',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              size: 16,
                              color: Colors.red.shade600,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Delete',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.red.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    onSelected: (value) => _handleNotificationAction(
                      context,
                      notification,
                      value,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationIcon(AppNotification notification) {
    Color iconColor;
    IconData iconData;

    switch (notification.type) {
      case NotificationType.error:
        iconColor = Colors.red;
        iconData = Icons.error;
        break;
      case NotificationType.warning:
        iconColor = Colors.orange;
        iconData = Icons.warning;
        break;
      case NotificationType.success:
        iconColor = Colors.green;
        iconData = Icons.check_circle;
        break;
      case NotificationType.overdue:
        iconColor = Colors.red;
        iconData = Icons.schedule;
        break;
      case NotificationType.newApplication:
        iconColor = Colors.blue;
        iconData = Icons.add_box;
        break;
      case NotificationType.paymentReminder:
        iconColor = Colors.amber;
        iconData = Icons.payment;
        break;
      case NotificationType.taskAssigned:
        iconColor = Colors.purple;
        iconData = Icons.assignment;
        break;
      case NotificationType.deadlineApproaching:
        iconColor = Colors.orange;
        iconData = Icons.access_time;
        break;
      case NotificationType.statusChanged:
        iconColor = Colors.blue;
        iconData = Icons.update;
        break;
      case NotificationType.documentUploaded:
        iconColor = Colors.green;
        iconData = Icons.upload_file;
        break;
      case NotificationType.messageReceived:
        iconColor = Colors.blue;
        iconData = Icons.message;
        break;
      default:
        iconColor = Colors.grey;
        iconData = Icons.info;
    }

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: iconColor.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        iconData,
        size: 16,
        color: iconColor,
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              'Error loading notifications',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                setState(() {}); // Trigger rebuild
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_off,
              size: 48,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              _showUnreadOnly
                  ? localizations.notificationsEmpty
                  : localizations.notificationsEmpty,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleNotificationTap(
      BuildContext context, AppNotification notification) {
    // Mark as read if not already read
    if (!notification.isRead) {
      context.read<NotificationService>().markAsRead(notification.id);
    }

    // Navigate to related screen if actionRoute is provided
    if (notification.actionRoute != null) {
      // Navigator.pushNamed(context, notification.actionRoute!);
      // For now, just show a snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Navigate to: ${notification.actionRoute}'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  void _handleNotificationAction(
      BuildContext context, AppNotification notification, String action) {
    final notificationService = context.read<NotificationService>();

    switch (action) {
      case 'read':
        if (notification.isRead) {
          // Mark as unread (would need to implement this method)
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Mark as unread not implemented yet')),
          );
        } else {
          notificationService.markAsRead(notification.id);
        }
        break;
      case 'delete':
        notificationService.deleteNotification(notification.id);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Notification deleted')),
        );
        break;
    }
  }
}
