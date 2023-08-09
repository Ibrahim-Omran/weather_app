import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_new/cubit/weather_cubit.dart';
import 'package:weather_app_new/cubit/weather_state.dart';
import 'package:weather_app_new/screens/home_screen.dart';
import 'package:weather_app_new/widget/button.dart';
import '../model/weather_model.dart';


class ShowWeather extends StatelessWidget {
  ShowWeather({super.key});

  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],

      body : BlocBuilder<WeatherCubit,WeatherState>(

        builder: (context,state){
          if(state is LoadingWeather){
            // بنعمل لود بعلامة الكرة الارضية
            return const Center(
              child: SizedBox(
              height: 300,
              width: 300,
              child: FlareActor(
                'assets/WorldSpin.flr',
                fit: BoxFit.contain ,
                animation: 'roll',
              ),
            ),);
          }else if(state is WeatherSuccess){
            // هيرح يجيب بيانات المدينه
            weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
            return Show(weatherData: weatherData);
          }else if(state is WeatherFailure){
            // لو حصل اي خطاْ اعرض السرش بيدج تاني
            return SearchPage();
          }else{
            // اول ما الاب يفتح لوح لسيرش
            return SearchPage();
          }
        },
      ),
    );
  }
}

class Show extends StatelessWidget {
  const Show({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          const Spacer(flex:1,),
         //---image-----
          const Center(
            child: SizedBox(
              height: 300,
              width: 300,
              child: FlareActor(
                'assets/WorldSpin.flr',
                fit: BoxFit.contain ,
                animation: 'roll',
              ),
            ),
          ),
         //--------name city-----------------------
          Center(
            child: Text(BlocProvider.of<WeatherCubit>(context).cityName!,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.white70,
              ),),
          ),

          const SizedBox(height: 15,),

          //-----temp-----------------
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:   [
              Text(weatherData!.temp.toInt().toString(),
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                ),),
              const SizedBox(height: 2,),
              const Text('temperature',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                ),),],),

          const SizedBox(height: 20,),

           //----mintemp---max----------
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('${weatherData!.maxTemp.toInt()}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                      ),),
                    const SizedBox(height: 2,),
                    const Text('MaxTemp',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                      ),),
                  ],),

                     //-----------
                Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('${weatherData!.minTemp.toInt()}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                        ),),
                      const SizedBox(height: 2,),
                      const Text('MinTemp',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                        ),),]),

              ]),

          const SizedBox(height: 30,),

               //----search-----
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CustomButton(
              namButton: 'Back',
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),

          const Spacer(flex: 1,),

        ],
      );
  }
}





//
// Column(
//
// children: [
// Spacer(flex:1,),
// //---image-----
// Center(
// child: Container(
// height: 300,
// width: 300,
// child: FlareActor(
// 'assets/WorldSpin.flr',
// fit: BoxFit.contain ,
// animation: 'roll',
// ),
// ),
// ),
// //--------name city-----------------------
// Center(
// child: Text(Provider.of<WeatherProvider>(context).cityName!,
// style: const TextStyle(
// fontSize: 30,
// fontWeight: FontWeight.w500,
// color: Colors.white70,
// ),),
// ),
//
// const SizedBox(height: 15,),
//
// //-----temp-----------------
// Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children:   [
// Text(weatherData!.temp.toInt().toString(),
// style: const TextStyle(
// fontSize: 50,
// fontWeight: FontWeight.w500,
// color: Colors.white70,
// ),),
// const SizedBox(height: 2,),
// const Text('temperature',
// style: TextStyle(
// fontSize: 15,
// fontWeight: FontWeight.w500,
// color: Colors.white70,
// ),),],),
//
// const SizedBox(height: 20,),
//
// //----mintemp---max----------
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Column(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Text('${weatherData!.maxTemp.toInt()}',
// style: const TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.w500,
// color: Colors.white70,
// ),),
// const SizedBox(height: 2,),
// const Text('MaxTemp',
// style: TextStyle(
// fontSize: 15,
// fontWeight: FontWeight.w500,
// color: Colors.white70,
// ),),
// ],),
//
// //-----------
// Column(
// mainAxisAlignment: MainAxisAlignment.end,
// children: [
// Text('${weatherData!.minTemp.toInt()}',
// style: const TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.w500,
// color: Colors.white70,
// ),),
// const SizedBox(height: 2,),
// const Text('MinTemp',
// style: TextStyle(
// fontSize: 15,
// fontWeight: FontWeight.w500,
// color: Colors.white70,
// ),),]),
//
// ]),
//
// const SizedBox(height: 30,),
//
// //----search-----
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 15),
// child: CustomButton(
// namButton: 'Back',
// onTap: (){
// Navigator.pop(context);
// },
// ),
// ),
//
// Spacer(flex: 1,),
//
// ],
// ),