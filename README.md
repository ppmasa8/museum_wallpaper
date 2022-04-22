## Problems

- It takes too long to display the image.

## Survey

- Measure the time until the api response comes back.
- Measure the time it takes to display the image after getting the URL. 

## Solutions

- The first 100 or so images will be displayed directly from the url obtained from the api, and if the number of images exceeds that number, or if the user searches for images, the images will be retrieved from the api.
- Put everything into the database in advance.

## What needs to be changed
### Design
- lib/view/utils/helpers/style_helper.dart
- lib/view/utils/helpers/color_helper.dart
- lib/view/utils/shared/shared_grid_widget.dart
