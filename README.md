# kf_ess_mobile_app

A new Flutter project.

## Introduction

TODO: Provide a short introduction to the project, including its objectives and motivation.

## Getting Started

Follow these steps to set up and run the project:

1. **Installation**  
   - Ensure you have Flutter installed. Refer to the [Flutter installation guide](https://docs.flutter.dev/get-started/install).
   - Clone this repository:  
     ```bash
     git clone <repository-url>
     cd kf_ess_mobile_app
     ```

2. **Dependencies**  
   - Install project dependencies:  
     ```bash
     flutter pub get
     ```

3. **Build Runner**  
   - Generate necessary files:  
     ```bash
     dart run build_runner build --delete-conflicting-outputs
     ```

4. **Native Splash Screen**  
   - Create the splash screen:  
     ```bash
     dart run flutter_native_splash:create --path=flutter_native_splash.yaml
     ```

5. **Mason Templates**  
   - Add and use Mason templates:  
     ```bash
     mason remove clean_module
     mason add clean_module --git-url https://github.com/heshesh2010/bricks-diyar/ --git-path clean_module
     mason make clean_module --name loanRequest --hasLocalData false --hasRemoteData true --state_management cubit --areCommentsOn true --addTemplateCode true
     ```

## Build and Test

TODO: Provide instructions for building and testing the project.

## Contribute

Contributions are welcome! Follow these steps to contribute:

1. Fork the repository.
2. Create a new branch:  
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. Commit your changes:  
   ```bash
   git commit -m "Add your message here"
   ```
4. Push to the branch:  
   ```bash
   git push origin feature/your-feature-name
   ```
5. Open a pull request.

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

## TODO Sections

- Replace placeholders with project-specific details.
- Add API references, latest releases, and testing instructions.


flutter build apk --split-per-abi