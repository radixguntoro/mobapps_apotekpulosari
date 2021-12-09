import 'package:apotik_pulosari/components/utilities/color.dart';
import 'package:flutter/material.dart';

class RespError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Center(
        child: Container(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
          decoration: BoxDecoration(
            color: Colors.red[100],
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: Colors.red[200],
              style: BorderStyle.solid,
              width: 1,
            )
          ),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Maaf, terjadi kesalahan!",
                  style: TextStyle(
                    color: Colors.red[900],
                    fontStyle: FontStyle.italic,
                  )
                ),
                TextSpan(
                  text: " silahkan hubungi",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.red[900],
                  )
                ),
                TextSpan(
                  text: " Software Developer.",
                  style: TextStyle(
                    color: Colors.red[900],
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600
                  )
                )
              ]
            ),
          )
        ),
      ),
    );
  }
}

class LoadingShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      padding: EdgeInsets.only(bottom: 16),
      itemBuilder: (context, i) => Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          
        ),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: 56,
                  height: 56,
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    shape: BoxShape.circle
                  ),
                  child: Container(
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 8,
                    margin: EdgeInsets.only(bottom: 6),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[100]),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 8,
                    margin: EdgeInsets.only(bottom: 8),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[100]),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 8,
                    margin: EdgeInsets.only(bottom: 6),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[100]),
                    ),
                  ),
                ],
              )
            ),
          ],
        )
      ),
    );
  }
}

class LoadingShimmerRecap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      itemCount: 10,
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemBuilder: (context, i) => Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * .5,
                    height: 8,
                    margin: EdgeInsets.only(bottom: 8),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[100]),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 8,
                    margin: EdgeInsets.only(bottom: 6),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[100]),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .25,
                    height: 8,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[100]),
                    ),
                  ),
                ],
              )
            ),
          ],
        )
      ),
    );
  }
}

class LoadingNextForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 296,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                strokeWidth: 5,
                valueColor: AlwaysStoppedAnimation<Color>(ColorTheme.primary),
              ),
            ),
            Text(
              "Proses Selanjutnya...",
              style: TextStyle(
                color: ColorTheme.primary,
                fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingSaveForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        )
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * .75,
              child: Image(
                image: AssetImage("assets/images/icons/resp_page/progress.png"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: 32,
              height: 32,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(ColorTheme.third),
              ),
            ),
            Text(
              "Proses Menyimpan...",
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                strokeWidth: 5,
                valueColor: AlwaysStoppedAnimation<Color>(ColorTheme.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}