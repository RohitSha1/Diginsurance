import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_health_hospital_app/logic/bloc_home_page/homepage_bloc.dart';
import 'package:one_health_hospital_app/presentation/helpers/colors.dart';
import 'package:one_health_hospital_app/presentation/screen_appointments/screen_appointments.dart';
import 'package:one_health_hospital_app/presentation/screen_departments/screen_departments.dart';
import 'package:one_health_hospital_app/presentation/screen_prescriptions/screen_prescriptions.dart';
import 'package:one_health_hospital_app/presentation/screen_search/screen_search.dart';
import 'package:one_health_hospital_app/presentation/widgets/consultation_card.dart';
import 'package:one_health_hospital_app/presentation/widgets/precription_card.dart';
import 'package:one_health_hospital_app/presentation/widgets/specialist_card.dart';
import 'package:one_health_hospital_app/themedata.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: kboxdecoration,
      child: BlocConsumer<HomepageBloc, HomepageState>(
        listener: (context, state) {
          if (state is HomePageNavigateToDepartmentsState) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ScreenDepartments(
                department: state.department,
                currentIndex: state.currentIndex,
              ),
            ));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80.0),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: ListTile(
                    leading: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: DecorationImage(
                          image: NetworkImage(state is HomepageInitialState
                              ? state.userImage
                              : state is HomePageFetchDoctorsSuccessState
                                  ? state.userImage
                                  : 'https://cdn.icon-icons.com/icons2/2643/PNG/512/male_boy_person_people_avatar_icon_159358.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                        state is HomepageInitialState
                            ? state.userName
                            : state is HomePageFetchDoctorsSuccessState
                                ? state.userName
                                : 'Welcome',
                        style:
                            theme.textTheme.headline3?.copyWith(fontSize: 18)),
                    subtitle: Text(
                      "Find your Insurance here",
                      style: theme.textTheme.subtitle2,
                    ),
                    trailing: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: theme.cardColor,
                      ),
                      child: IconButton(
                        icon:
                            const Icon(Icons.search, color: kPrimaryLightColor),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ScreenSearch(
                                // department:
                                //     state is HomePageFetchDoctorsSuccessState
                                //         ? state.departmentList!
                                //         : null,
                                // isSearching: true,
                                // currentIndex: 0,
                                ),
                          ));
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 25.0),
                  // const SizedBox(height: 25.0),

                  const SizedBox(height: 25.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      children: <Widget>[
                        Text("Appointments",
                            style: theme.textTheme.headline3?.copyWith(
                              fontSize: 18,
                            )),
                        const Spacer(),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: ScreenAppointments(
                                          appointment: state
                                                  is HomePageFetchDoctorsSuccessState
                                              ? state.appointmentList
                                              : null),
                                      type: PageTransitionType.rightToLeft));
                            },
                            child: Text("View all",
                                style: theme.textTheme.subtitle1)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 150.0,
                      child: ListView.builder(
                        itemCount: state is HomePageFetchDoctorsSuccessState
                            ? state.appointmentList!.isEmpty
                                ? 1
                                : state.appointmentList!.length
                            : 5,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          if (state is HomePageFetchDoctorsSuccessState) {
                            if (state.appointmentList!.isEmpty) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 150.0,
                                child: Center(
                                  child: Text(
                                    'No Scheduled Appointments Found',
                                    style: theme.textTheme.headline3?.copyWith(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                ),
                              );
                            }
                            if (state.appointmentList![index].status ==
                                'Scheduled') {
                              return AppoinmentCard(
                                  appointment: state.appointmentList![index]);
                            } else {
                              return const SizedBox();
                            }
                          }
                          return const AppoinmentCardShimmer();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      children: <Widget>[
                        Text("Recent Prescriptions",
                            style: theme.textTheme.headline3?.copyWith(
                              fontSize: 18,
                            )),
                        const Spacer(),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ScreenPrescriptions(
                                        prescriptionList: state
                                                is HomePageFetchDoctorsSuccessState
                                            ? state.prescriptionList
                                            : null,
                                      )));
                            },
                            child: Text("View all",
                                style: theme.textTheme.subtitle1)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  SizedBox(
                    width: double.infinity,
                    height: 150.0,
                    child: ListView.builder(
                      itemCount: state is HomePageFetchDoctorsSuccessState
                          ? state.prescriptionList!.length
                          : 5,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        // var doctor = doctorList[index];
                        if (state is HomePageFetchDoctorsSuccessState) {
                          if (state.prescriptionList!.isEmpty) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 150.0,
                              child: Center(
                                child: Text(
                                  'No Prescriptions Found',
                                  style: theme.textTheme.headline3?.copyWith(
                                      fontSize: 18, color: Colors.black),
                                ),
                              ),
                            );
                          }
                          if (state.prescriptionList != null) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: PrescriptionCard(
                                prescription: state.prescriptionList![index],
                              ),
                            );
                          } else {}

                          // return DoctorCard(doctor: );
                        }
                        return const AppoinmentCardShimmer();
                      },
                    ),
                  ),
                  const SizedBox(height: 15),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text("Specialist",
                        style:
                            theme.textTheme.headline3?.copyWith(fontSize: 18)),
                  ),
                  const SizedBox(height: 15.0),
                  SizedBox(
                    width: double.infinity,
                    height: 150.0,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: state is HomePageFetchDoctorsSuccessState
                            ? state.departmentList?.length
                            : 5,
                        itemBuilder: (context, index) {
                          if (state is HomePageFetchDoctorsSuccessState) {
                            return SpecialistCard(
                              departments: state.departmentList,
                              index: index,
                              name: state.departmentList![index].name!,
                              color: cardsColorsList[index],
                              doctor: state
                                  .departmentList![index].doctors!.length
                                  .toString(),
                              icon: "images/doctor.svg",
                            );
                          }
                          return Shimmer.fromColors(
                            baseColor: Colors.red[300]!.withOpacity(0.1),
                            highlightColor: Colors.grey[200]!.withOpacity(0.4),
                            child: SpecialistCard(
                              index: index,
                              name: 'One Health',
                              color: cardsColorsList[index],
                              doctor: '2',
                              icon: "images/doctor.svg",
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
