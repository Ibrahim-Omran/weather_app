import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_new/screens/show_weather.dart';
import '../cubit/weather_cubit.dart';
import '../widget/button.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Column(

          children: [
            const SizedBox(height: 50,),
            //---image-----
            const Center(
              child: SizedBox(
                height: 300,
                width: 300,
                child:  FlareActor(
                  'assets/WorldSpin.flr',
                  fit: BoxFit.contain ,
                  animation: 'roll',
                ),
              ),
            ),
            //--------text  search-----------
            const Center(
              child: Text('Search Weather',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                ),),
            ),
            //--------------------------------
            const SizedBox(height: 40,),
            //---text filed-------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                onChanged: (data){
                  cityName = data;
                },

                onSubmitted: (data) async{
                   cityName = data;

                   BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName!);
                   BlocProvider.of<WeatherCubit>(context).cityName = cityName ;

                   Navigator.push(context, MaterialPageRoute(
                      builder: (_)=> ShowWeather()),);
                },

                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white60,
                  contentPadding:
                   const EdgeInsets.symmetric(vertical: 30, horizontal:30),
                    suffixIcon: GestureDetector(

                      onTap : () async
                      {
                        BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName!);
                        BlocProvider.of<WeatherCubit>(context).cityName = cityName ;


                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=> ShowWeather()),);
                      },
                      child: const Icon(Icons.search,color: Colors.black,)),
                  enabledBorder:  const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  hintText: 'Enter a city',
                  hintStyle: const TextStyle(
                    color: Colors.black26,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 50,),
            // ---button search-------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomButton(
                namButton: 'Search',
                onTap: () async{
                  BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName!);
                  BlocProvider.of<WeatherCubit>(context).cityName = cityName ;

                  Navigator.push(context, MaterialPageRoute(
                      builder: (_)=> ShowWeather()),);

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}






// final ButtonStyle flatButtonStyle = TextButton.styleFrom(
//   backgroundColor: Colors.lightBlueAccent,
//
//   shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.all(Radius.circular(10))),
// );
//
//
// Center(
// child: Padding(
// padding: const EdgeInsets.symmetric(horizontal: 16),
// child: TextField(
// onChanged: (data){
// cityName = data;
// },
// onSubmitted: (data) async{
// cityName = data;
//
//
// WeatherService service = WeatherService();
// WeatherModel? weather = await service.getWeather(cityName: cityName!);
// // نوع البيانات
// Provider.of<WeatherProvider>(context,listen: false).weatherData = weather ;
// Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;
// //weatherData = weather ;
// //updateUi!();//  عشان يعمل ابديت للاسكرين
// Navigator.push(context, MaterialPageRoute(
// builder: (_)=> ShowWeather()),);
//
// },
//
// decoration: InputDecoration(
// contentPadding:
// EdgeInsets.symmetric(vertical: 32, horizontal: 24),
// label: Text('search'),
//
// suffixIcon: GestureDetector(
//
// onTap : () async
// {
// WeatherService service = WeatherService();
//
// WeatherModel? weather =
//     await service.getWeather(cityName: cityName!);
//
// Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
// Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;
//
// Navigator.push(context, MaterialPageRoute(
// builder: (context)=> ShowWeather()),);
// },
// child: Icon(Icons.search)),
// border: OutlineInputBorder(),
// hintText: 'Enter a city',
// ),
// ),
// ),
// ),