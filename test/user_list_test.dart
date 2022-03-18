import 'package:bloc_test/bloc_test.dart';
import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/app/modules/home/bloc/user_list_cubit.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart' as mockito;

import 'user_list_test.mocks.dart';

List<UserEntity> mockUserList = [
  UserEntity(id: '1', title: 'One title', firstName: 'One firstName', ),
  UserEntity(id: '2', title: 'Two title', firstName: 'Two firstName', ),
  UserEntity(id: '3', title: 'Three title', firstName: 'Three firstName', ),
  UserEntity(id: '4', title: 'Four title', firstName: 'Four firstName', ),
];

// Mock Cubit
class MockUserListCubit extends MockCubit<UserListState> implements UserListCubit {}

// // Mock Bloc
// class MockCounterBloc extends MockBloc<CounterEvent, int>
//     implements CounterBloc {}

void main() {
  mainCubit();
  // mainBloc();
}

@GenerateMocks([UserRepo])
void mainCubit() {
  // group('UserListCubit manual case', () {
  //   test("emits [UserListLoadedState] when loadData is called", () {
  //     // Create Mock CounterCubit Instance
  //     final cubit = MockUserListCubit();
  //
  //     // Stub the listen with a fake Stream
  //     whenListen(cubit, Stream.fromIterable([0, 1, 2, 3]));
  //
  //     // Expect that the CounterCubit instance emitted the stubbed Stream of
  //     // states
  //     expectLater(cubit.stream, emitsInOrder(<int>[0, 1, 2, 3]));
  //   });
  // });
  late UserListCubit cubit;
  late UserRepo userService;
  setUp(() async {
    userService = MockUserService();
    cubit = UserListCubit(userService: userService);
  });

  group('UserListCubit manual case', () {
    blocTest<UserListCubit, UserListState>(
      'emits [UserListLoadedState] when loadData is called',
      build: () {
        mockito
            .when(userService.fetchUserList(page: 1))
            .thenAnswer((_) => Future.value(mockUserList));
        return cubit;
      },
      act: (cubit) => cubit.loadData(),
      expect: () => [isA<UserListLoading>(),isA<UserListLoaded>()],
    );
  });
}

// void mainBloc() {
//   group('whenListen', () {
//     test("Let's mock the CounterBloc's stream!", () {
//       // Create Mock CounterBloc Instance
//       final bloc = MockCounterBloc();
//
//       // Stub the listen with a fake Stream
//       whenListen(bloc, Stream.fromIterable([0, 1, 2, 3]));
//
//       // Expect that the CounterBloc instance emitted the stubbed Stream of
//       // states
//       expectLater(bloc.stream, emitsInOrder(<int>[0, 1, 2, 3]));
//     });
//   });
//
//   group('CounterBloc', () {
//     blocTest<CounterBloc, int>(
//       'emits [] when nothing is added',
//       build: () => CounterBloc(),
//       expect: () => const <int>[],
//     );
//
//     blocTest<CounterBloc, int>(
//       'emits [1] when CounterIncrementPressed is added',
//       build: () => CounterBloc(),
//       act: (bloc) => bloc.add(CounterIncrementPressed()),
//       expect: () => const <int>[1],
//     );
//   });
// }