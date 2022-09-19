import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  HotelCubit() : super(HotelInitial());
}
