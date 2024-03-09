# pilar_mobile_challenge

Projeto em flutter de App mobile/web que consome a api do [TMDB](https://developers.themoviedb.org/3/getting-started/introduction) para listar filmes.

## Como executar o projeto

Para começar, verifique a integridade da sua instalação do flutter

    flutter doctor

clone o projeto e vá para o diretório dele

    git clone https://github.com/matheustimbo/pilar-mobile-challenge
    cd pilar_mobile_challenge

então, baixe as dependências do projeto e execute em modo debug

    flutter pub get
    flutter run

a versão web está disponivel para acesso em https://matheustimbo.github.io/

## Como gerar um relatório de testes

    flutter test --coverage && genhtml coverage/lcov.info -o coverage/html && open coverage/html/index.html

## Como gerar os arquivos .g das stores e models

Utilize

    dart run build_runner build --delete-conflicting-outputs

para gerar uma vez, ou

    dart run build_runner watch --delete-conflicting-outputs

para automaticamente observar mudanças e gerar quando necessário

## Bibliotecas utilizadas

- [flutter_mobx],[mobx] e [mobx_codegen] para as stores reativas.
- [dio](https://pub.dev/packages/dio) cliente HTTP
- [build_runner](https://pub.dev/packages/build_runner) gera arquivos .g das stores do mobx e models do freezed
- [intl](https://pub.dev/packages/intl) utilitários de internacionalização e localização
- [cached_network_image](https://pub.dev/packages/cached_network_image) cache de imagens
- [freezed], [freezed_annotation] e [json_serializable] para gerar dataclasses utilizadas nos models
- [pallete_generator] para determinar a cor primária de uma imagem
- [get_it] injeção de dependências
- [mockito] para gerar mocks em testes unitários
- [equatable], [google_fonts], [curved_progress_bar] e [shimmer] são utilitários menores
