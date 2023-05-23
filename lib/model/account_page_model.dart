import 'package:flutter/material.dart';

class AccountPageModel {
  Icon leading;
  String title;
  Icon trailing;
  AccountPageModel({
    required this.leading,
    required this.title,
    required this.trailing,
  });
}

List<AccountPageModel> account = [
  AccountPageModel(
    leading: const Icon(Icons.local_mall_outlined),
    title: "Orders",
    trailing: const Icon(Icons.chevron_right_outlined),
  ),
  AccountPageModel(
    leading: const Icon(Icons.contact_page_outlined),
    title: "My Details",
    trailing: const Icon(Icons.chevron_right_outlined),
  ),
  AccountPageModel(
    leading: const Icon(Icons.location_on_outlined),
    title: "Delivery Address",
    trailing: const Icon(Icons.chevron_right_outlined),
  ),
  AccountPageModel(
    leading: const Icon(Icons.payment_outlined),
    title: "Payment Method",
    trailing: const Icon(Icons.chevron_right_outlined),
  ),
  AccountPageModel(
    leading: const Icon(Icons.terminal_outlined),
    title: "Promo Code",
    trailing: const Icon(Icons.chevron_right_outlined),
  ),
  AccountPageModel(
    leading: const Icon(Icons.notifications_none_outlined),
    title: "Notification",
    trailing: const Icon(Icons.chevron_right_outlined),
  ),
  AccountPageModel(
    leading: const Icon(Icons.help_center_outlined),
    title: "Help",
    trailing: const Icon(Icons.chevron_right_outlined),
  ),
  AccountPageModel(
    leading: const Icon(Icons.info_outline),
    title: "About",
    trailing: const Icon(Icons.chevron_right_outlined),
  ),
];
