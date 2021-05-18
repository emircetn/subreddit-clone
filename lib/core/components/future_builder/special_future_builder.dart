import 'package:flutter/material.dart';

class SpecialFutureBuilder<T> extends StatelessWidget {
  final Future<T>? future;
  final Widget Function(T data) onSuccess;
  final Widget? notFoundWidget;
  final Widget? onError;
  final Widget? loading;
  const SpecialFutureBuilder({required this.future, required this.onSuccess, this.notFoundWidget, this.onError, this.loading});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.active:
            return loading ?? Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasData && !(snapshot.data! is List && snapshot.data!.length == 0)) {
              return onSuccess(snapshot.data);
            } else {
              return notFoundWidget ?? Center(child: Text('Hiç Veri Yok'));
            }
          default:
            return onError ?? Center(child: Text('Bir Hata Oluştu'));
        }
      },
    );
  }
}
