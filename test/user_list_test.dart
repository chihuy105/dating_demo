import 'package:bloc_test/bloc_test.dart';
import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/app/modules/swipe/bloc/user_list_cubit.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart' as mockito;

import 'user_list_test.mocks.dart';

List<UserEntity> mockUserList = [
  UserEntity(
    id: '1',
    title: 'One title',
    firstName: 'One firstName',
  ),
  UserEntity(
    id: '2',
    title: 'Two title',
    firstName: 'Two firstName',
  ),
  UserEntity(
    id: '3',
    title: 'Three title',
    firstName: 'Three firstName',
  ),
  UserEntity(
    id: '4',
    title: 'Four title',
    firstName: 'Four firstName',
  ),
];

// Mock Cubit
class MockUserListCubit extends MockCubit<UserListState>
    implements UserListCubit {}

// // Mock Bloc
// class MockCounterBloc extends MockBloc<CounterEvent, int>
//     implements CounterBloc {}

void main() {
  mainCubit();
  // mainBloc();
}

@GenerateMocks([UserRepo])
void mainCubit() {
  late UserListCubit cubit;
  late UserRepo userService;

  setUp(() async {
    userService = MockUserRepo();
    cubit = UserListCubit(userService: userService);
  });

  tearDown(() {});

  group('UserListCubit manual case', () {
    setUp(() async {
      mockito
          .when(userService.fetchUserList(page: 1))
          .thenAnswer((_) => Future.value(mockUserList));
      mockito
          .when(userService.fetchUserList(page: 2))
          .thenAnswer((_) => Future.value(mockUserList));
    });

    blocTest<UserListCubit, UserListState>(
      'emits [UserListLoadedState] when loadData return list user',
      build: () => cubit,
      act: (cubit) => cubit.loadData(),
      expect: () => [
        isA<UserListLoading>(),
        isA<UserListLoaded>().having(
            (state) => state.data.list.isNullOrEmpty(), 'List not null', false)
      ],
    );

    blocTest<UserListCubit, UserListState>(
      'emits [UserListLoadedState] when loadData twice return list user double the length',
      build: () => cubit,
      act: (cubit) async {
        await cubit.loadData();
        await cubit.loadData();
      },
      expect: () {
        return [
          isA<UserListLoading>(),
          isA<UserListLoaded>().having((state) => state.data.list.length,
              'List length equal mockList length', mockUserList.length),
          isA<UserListLoading>(),
          isA<UserListLoaded>().having((state) => state.data.list.length,
              'List length equal mockList length', mockUserList.length * 2)
        ];
      },
    );

    blocTest<UserListCubit, UserListState>(
      'emits [UserListLoadedState] when loadData return empty list',
      build: () {
        mockito
            .when(userService.fetchUserList(page: 1))
            .thenAnswer((_) => Future.value([]));
        return cubit;
      },
      act: (cubit) => cubit.loadData(),
      expect: () => [
        isA<UserListLoading>(),
        isA<UserListLoaded>().having(
            (state) => state.data.list.isNullOrEmpty(), 'List null', true)
      ],
    );
  });

  group('UserListCubit error case', () {
    blocTest<UserListCubit, UserListState>(
      'emits [UserListError] when loadData fail',
      build: () {
        mockito
            .when(userService.fetchUserList(page: 1))
            .thenAnswer((_) => Future.error('Fetch fail'));
        return cubit;
      },
      act: (cubit) => cubit.loadData(),
      expect: () => [isA<UserListLoading>(), isA<UserListError>()],
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
