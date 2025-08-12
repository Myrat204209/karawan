// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:karawan/blocs/cart/cart_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.select((CartBloc b) => b.state.items);

    // Calculate total
    final total = cart.entries.fold<double>(0.0, (sum, entry) {
      final product = getProductById(entry.key, AppSection.market);
      return product == null ? sum : sum + product.price * entry.value;
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Sebet',
          style: AppTextStyle.text().lg().bold().withColor(Colors.black),
        ),
        SizedBox(height: 20),
        if (cart.isEmpty)
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.shopping_cart_outlined,
                    size: 64,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Sebediňiz boş',
                    style: AppTextStyle.text().lg().semiBold().withColor(
                      Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sebediňizi doldurmak üçin harytlar goşuň',
                    style: AppTextStyle.text().md().withColor(Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        else
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final productId = cart.keys.elementAt(index);
                      final quantity = cart[productId]!;
                      final product = getProductById(
                        productId,
                        AppSection.market,
                      );

                      if (product == null) return SizedBox.shrink();

                      return AppCartItem(
                        onRemove: () => context.read<CartBloc>().add(
                          CartQuantityUpdated(
                            productId: productId,
                            quantity: 0,
                          ),
                        ),
                        onQuantityChanged: (newQuantity) =>
                            context.read<CartBloc>().add(
                              CartQuantityUpdated(
                                productId: productId,
                                quantity: newQuantity,
                              ),
                            ),
                        name: product.name,
                        price: product.price,
                        description: product.description,
                        quantity: quantity,
                        image: Image.asset(
                          product.imagePath,
                          fit: BoxFit.cover,
                        ),
                        section: AppSection.market,
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                  ),
                ),

                // Checkout Section
                Container(
                  padding: EdgeInsets.all(AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.1),
                        blurRadius: 8,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Total Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Jemi:',
                            style: AppTextStyle.text().md().bold().withColor(
                              Colors.black,
                            ),
                          ),
                          Text(
                            'TMT ${total.toStringAsFixed(2)}',
                            style: AppTextStyle.text().md().bold().withColor(
                              Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSpacing.md),

                      // Promotional Text
                      Text(
                        'Hormatly müşderi eger sizin sargyt sanyñyz 15 kan bolsa indiki sargyt mugt!',
                        style: AppTextStyle.text().sm().withColor(Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: AppSpacing.lg),

                      // Checkout Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Show checkout modal bottom sheet
                            _showCheckoutModalBottomSheet(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.getSectionAccent(
                              AppSection.market,
                            ),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              vertical: AppSpacing.lg,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Sargyt taýýarla',
                            style: AppTextStyle.text().md().bold().withColor(
                              Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  void _showCheckoutModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          _CheckoutModalBottomSheet(section: AppSection.market),
    );
  }
}

class _CheckoutModalBottomSheet extends HookWidget {
  const _CheckoutModalBottomSheet({required this.section});

  final AppSection section;

  @override
  Widget build(BuildContext context) {
    final paymentMethod = useState('Nagt');
    final deliveryType = useState('Standart eltip bermek (10.00)');
    final fullName = useState('Amanow Aman');
    final address = useState('Aşgabat ş.');
    final phone = useState('+993 62 122112');
    final note = useState('Sag boluň!');

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: EdgeInsets.only(top: AppSpacing.sm),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Title
          Padding(
            padding: EdgeInsets.all(AppSpacing.screenPadding),
            child: Text(
              'Sebet',
              style: AppTextStyle.text().lg().bold().withColor(Colors.black),
            ),
          ),

          // Form Content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.screenPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Payment Method Section
                  _buildSection(
                    'Töleg görnüşi',
                    Column(
                      children: [
                        _buildRadioTile(
                          'Nagt',
                          paymentMethod.value == 'Nagt',
                          (value) => paymentMethod.value = value,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: AppSpacing.xxl),

                  // Delivery Type Section
                  _buildSection(
                    'Eltip bermegiň görnüşi',
                    Column(
                      children: [
                        _buildRadioTile(
                          'Standart eltip bermek (10.00)',
                          deliveryType.value == 'Standart eltip bermek (10.00)',
                          (value) => deliveryType.value = value,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: AppSpacing.xxl),

                  // Customer Details Sections
                  _buildSection('Doly adyňyz', _buildTextField(fullName)),

                  SizedBox(height: AppSpacing.xl),

                  _buildSection('Siziň salgyňyz', _buildTextField(address)),

                  SizedBox(height: AppSpacing.xl),

                  _buildSection('Telefon belgiňiz', _buildTextField(phone)),

                  SizedBox(height: AppSpacing.xl),

                  _buildSection('Bellik', _buildTextField(note)),

                  SizedBox(height: AppSpacing.xxxl),
                ],
              ),
            ),
          ),

          // Order Button
          Container(
            padding: EdgeInsets.all(AppSpacing.screenPadding),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _showOrderSuccessDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.getSectionAccent(section),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.lg),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Sargyt et',
                  style: AppTextStyle.text().md().bold().withColor(
                    Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.text().md().bold().withColor(Colors.black),
        ),
        SizedBox(height: AppSpacing.md),
        content,
      ],
    );
  }

  Widget _buildRadioTile(String title, bool value, Function(String) onChanged) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: value
              ? AppColors.getSectionAccent(section)
              : Colors.grey.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Radio<String>(
            value: title,
            groupValue: value ? title : null,
            onChanged: (newValue) => onChanged(newValue!),
            activeColor: AppColors.getSectionAccent(section),
          ),
          SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              title,
              style: AppTextStyle.text().md().withColor(Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(ValueNotifier<String> controller) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2), width: 1),
      ),
      child: TextFormField(
        initialValue: controller.value,
        onChanged: (value) => controller.value = value,
        style: AppTextStyle.text().md().withColor(Colors.black),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          hintText: 'Giriziň...',
          hintStyle: AppTextStyle.text().md().withColor(Colors.grey),
        ),
      ),
    );
  }

  void _showOrderSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.xxl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: AppColors.getSectionAccent(
                    section,
                  ).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  color: AppColors.getSectionAccent(section),
                  size: 48,
                ),
              ),
              SizedBox(height: AppSpacing.lg),
              Text(
                'Order Placed Successfully!',
                style: AppTextStyle.text().lg().bold().withColor(Colors.black),
              ),
              SizedBox(height: AppSpacing.sm),
              Text(
                'Your order has been placed and will be delivered soon.',
                style: AppTextStyle.text().md().withColor(Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSpacing.xxl),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Clear cart after successful order
                    final storage = StorageProvider();
                    storage.clearCart(section);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.getSectionAccent(section),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Continue Shopping',
                    style: AppTextStyle.text().md().bold().withColor(
                      Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
