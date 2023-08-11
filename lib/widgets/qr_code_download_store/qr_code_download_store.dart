import 'package:flutter/widgets.dart';
import 'package:tricommon/common.dart';

class QrCodeDownloadStore extends StatelessWidget {
  final TribancoDownloadQrCode type;
  const QrCodeDownloadStore({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.0.hsp),
        child: Column(
          children: [
            SizedBox(
              height: 180.0.wsp,
              width: 180.0.wsp,
              child: QrImageView(
                data: qrCodeDownload(type),
                version: QrVersions.auto,
                padding: const EdgeInsets.all(0.0),
              ),
            ),
            SizedBox(height: 24.0.hsp),
            SvgPicture.asset(
              storeDownload(type),
              package: 'common',
              fit: BoxFit.fitHeight,
            )
          ],
        ),
      ),
    );
  }

  String qrCodeDownload(TribancoDownloadQrCode type) {
    if (type == TribancoDownloadQrCode.ios) {
      return 'https://apps.apple.com/br/app/tribanco-empresas-2-0/id1668800725';
    } else {
      return 'https://play.google.com/store/apps/details?id=br.com.tribanco.app.pj';
    }
  }

  String storeDownload(TribancoDownloadQrCode type) {
    if (type == TribancoDownloadQrCode.ios) {
      return 'assets/images/app-store.svg';
    } else {
      return 'assets/images/google-play.svg';
    }
  }
}

enum TribancoDownloadQrCode { ios, android }
