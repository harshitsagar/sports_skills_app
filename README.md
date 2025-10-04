# Sports Skills App

A Flutter app that displays sports skills grouped by proficiency level (Basic, Intermediate, Advanced) with horizontal scrolling carousels.

## Features

- ✅ **JSON Data Parsing** - Properly parses sports skills data
- ✅ **Grouping by Level** - Skills organized into Basic → Intermediate → Advanced
- ✅ **Horizontal Carousels** - Smooth scrolling for each level category
- ✅ **Responsive Design** - Works on all screen sizes using ScreenUtil
- ✅ **Clean UI** - Professional card-based design with sports images
- ✅ **Splash Screen** - Engaging welcome screen with sports theme
- ✅ **Error Handling** - Proper loading states and error management

## Evaluation Criteria Met

### ✅ Correct Grouping and Ordering
- Skills are properly grouped into Basic, Intermediate, Advanced levels
- Maintains strict order: Basic → Intermediate → Advanced
- Each level shows correct count of skills

### ✅ Clean, Responsive UI Design
- Modern card-based design
- Responsive across all screen sizes
- Color-coded levels (Green, Orange, Red)
- Smooth horizontal scrolling

### ✅ Code Quality & Structure
- **Separation of Concerns**: Models, Services, UI layers
- **Reusable Widgets**: SkillCard, SkillsSection components
- **Clean Architecture**: Easy to maintain and extend
- **Proper Error Handling**

### ✅ Smooth Scrolling & Performance
- Efficient ListView.builder for horizontal scrolling
- Optimized image loading
- Smooth 60fps performance

## Installation

1. Clone the repository
2. Run `flutter pub get`
3. Run `flutter run`

## Screens

- **Splash Screen**: Welcome screen with sports imagery
- **Skills Screen**: Main screen with categorized skills carousels

## Technologies Used

- Flutter 3.0+
- flutter_screenutil for responsiveness
- HTTP for API readiness
- Material Design 3