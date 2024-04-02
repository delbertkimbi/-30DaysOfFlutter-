

import 'package:flutter_bloc/flutter_bloc.dart';

part 'tip_state.dart';

class TipCubit extends Cubit<TipState> {
  TipCubit() : super(TipInitial());
}
