import 'package:flutter/material.dart';
import 'package:qrcode_bloc/bloc/auth/auth_bloc.dart';
import 'package:qrcode_bloc/routes/router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          late String title;
          late IconData icon;
          late VoidCallback onTap;

          switch (index) {
            case 0:
              title = 'Add Product';
              icon = Icons.post_add_rounded;
              onTap = () => context.goNamed(RouteNames.addProduct);
              break;
            case 1:
              title = 'Product';
              icon = Icons.list_alt_outlined;
              onTap = () {};
              break;
            case 2:
              title = 'QR Code';
              icon = Icons.qr_code;
              onTap = () {};
              break;
            case 3:
              title = 'Catalog';
              icon = Icons.document_scanner_outlined;
              onTap = () {};
              break;
            default:
          }

          return Material(
            color: Colors.grey.shade300,
            child: InkWell(
              borderRadius: BorderRadius.circular(9.0),
              onTap: onTap,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Icon(
                        icon,
                        size: 50,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      title,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<AuthBloc>().add(AuthEventLogout());
        },
        child: const Icon(Icons.logout_outlined),
      ),
    );
  }
}
