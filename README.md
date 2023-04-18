# desafio_marvel
Flutter Sr challenge by Marvel

This is a sample infinite scroll view application using the Marvel API.
We have a horizontal scroll with a time of 3 seconds to change the first five cards
and a vertical infinite scroll view of all the latest items with 10 items per page

# dependencies

cached_network_image 3.2.3 https://pub.dev/packages/cached_network_image <br>
unicons 2.0.2 https://pub.dev/packages/unicons <br>
dartz 0.10.1 https://pub.dev/packages/dartz <br>
shimmer 2.0.0 https://pub.dev/packages/shimmer <br>
flutter_bloc 8.1.2 https://pub.dev/packages/flutter_bloc <br>
dio 5.1.1 https://pub.dev/packages/dio <br>
flutter_modular 5.0.3 https://pub.dev/packages/flutter_modular <br>

# dev deependencies

mocktail 0.3.0 https://pub.dev/packages/mocktail

#arch

We have an model of DDD Domain Driven Design implementation using
flutter_modular to define all modules. The implementation consists 
in a domain layer, infrastructure layer, external layer and 
presentation layer. 

Presentation -> State Management -> Usecase(Domain) -> Repository(Infrastructure) -> Datasource(External)

All modules consists in follow this sample. 

Domain layer will validate the params and entities in ech usecase.
Infrastructure layer will transform objects in entities and error handling.
External layer will comunicate with api to receive the objects.
Presentation layer will provide the views, widget, modules and state management classes.

Each layer have unity tests on every principal class.

#CI/CD

On every push on this repo, a job run this steps in order:

  Push all dependencies of project.
  Analyze project source.
  Run all unity tests of project.
  
  See more on Actions
