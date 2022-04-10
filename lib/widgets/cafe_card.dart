
import 'package:flutter/material.dart';
import 'package:project/Constants/config.dart';
import 'package:project/Models/cafe.dart';

class CafeCard extends StatelessWidget {
  final double? pinPillPosition;
  final Cafe? currentCafeSelect;
  static const _endpoint = 'https://maps.googleapis.com/maps/api/place/photo';
  
  const CafeCard({Key? key, this.pinPillPosition, this.currentCafeSelect}) : super(key: key);

  
  String _photoApi() {
     String imageUrl = "";
    if(currentCafeSelect!.photoRef == "" || currentCafeSelect!.photoRef == null){
       imageUrl = "https://maps.googleapis.com/maps/api/place/photo?maxheight=150&photoreference=Aap_uEDPVf8wR4UEpWjoi5rQSvwnYOKpik0IfnbZzjf6zJYrXKSF7r0LsTtM_IYC4EHOfRGmHtKPoDLBHxAhSWHmHGD6HOWgTC3x_QdAUkondaJqxcKFkGhTeR4PZ0GIltYRuJhgCUs13KD3TUPcLSrzNdEJMEeSJBwGRvS45zbV41nu7oyK&key=AIzaSyBJOmJ9V6iuxpDI5ei9kv1nEcAaa-FBLQg";
    }else{
      imageUrl = _endpoint +'?maxheight=150&photoreference=' +currentCafeSelect!.photoRef +'&key=' +apiKey;
    }
    
    print(imageUrl);
    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
              bottom: pinPillPosition,
              right: 0,
              left: 0,
              duration: const Duration(milliseconds: 200),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.all(15),
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            blurRadius: 20,
                            offset: Offset.zero,
                            color: Colors.grey.withOpacity(0.5))
                      ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: Image.network(_photoApi(),
                                height: 150.0,
              width: 70.0,fit: BoxFit.cover,)

                          ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(currentCafeSelect!.name,
                                  style: const TextStyle(color: Colors.brown, fontWeight: FontWeight.bold)),
                              Text(
                                  "Latitude: " +
                                      currentCafeSelect!.lat.toString(),
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey)),
                              Text(
                                  "Longitude: " +
                                      currentCafeSelect!.lon.toString(),
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey))
                            ], // end of Column Widgets
                          ), // end of Column
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                         child: Image.asset('assets/images/sign.png',fit: BoxFit.cover,),
                      )
                    ],
                  ),
                ),
              ));
  }
}