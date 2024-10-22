# **hw3**

## Overview

A Book Club App implemented using Bloc.

## Specific Feature

- Book images are generated with placehold.co. Different colors are defined to
distinguish different books. Other than colors, the author and title info are
shown on top of the image for easier identify the sorted result.

- A shimmer is designed according to the BookList layout to display a smooth
transition.

## Implementing Details

All book info(title, author, description and imageUrl) in this app are generated using Mock class(in service folder). 

HomePage with bloc and views are in lib/pages/home.

The content(view) of the HomePage is displayed according to the what current
state is.
- Loading state -> LoadingView
- BookDetails state -> BookDetailsView
- BookList state -> BookListView

3 states are defined in HomeState. They are emitted according to event trigger.
The trigger logic is in HomeBloc.
- BookListEvent -> BookList state
- SortByTitleEvent -> Loading state and BookList state
- SortByAuthorEvent -> Loading state and BookList state
- BookDetailsEvent -> BookDetails state

4 events are defined in HomeEvent. They are triggered by the elements of UI.
- Back leading button in BookDetailsView -> BookListEvent
- Sort by title button in BookListView -> SortByTitleEvent.
- Sort by author button in BookListView -> SortByAuthorEvent.
- Book images in BookListView -> BookDetailsEvent.
