# movielist
Um catálogo de filmes com lista de favoritos a partir da API do [TMDB](https://www.themoviedb.org/?language=pt-BR).

## Rodando o projeto
```
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```
## Observações técnicas

Esse projeto utiliza o [BLOC](https://medium.com/codechai/architecting-your-flutter-project-bd04e144a8f1) como arquitetura e padrão de gerenciamento de estado.
Escolhi o BLOC como padrão de arquitetura pois se aproxima bastante da arquitetura MVVM utilizada no Android, que é amplamente adotada pela comunidade,
recomandedada pela [documentação do Android](https://developer.android.com/jetpack/guide#recommended-app-arch) e contribui para maior manutenibilidade, extensibilidade e testabilidade do projeto.

<p align="center">
  <img src="https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/cubit_architecture_full.png" />
</p>

## Prints do aplicativo

## Referências técnicas

- [List of state management approaches](https://flutter.dev/docs/development/data-and-backend/state-mgmt/options)
- [Architect your Flutter project using BLOC pattern](https://medium.com/codechai/architecting-your-flutter-project-bd04e144a8f1)
- [BLoC, Reactive Programming, Streams - Practical use cases and useful patterns](https://www.didierboelens.com/2018/12/reactive-programming-streams-bloc-practical-use-cases/)
- [The Repository Pattern: Properly Organizing Your Data Layer](https://dev.to/adammc331/the-repository-pattern-properly-organizing-your-data-layer-10bg)
- [Guia para a arquitetura do app](https://developer.android.com/jetpack/guide#recommended-app-arch)




