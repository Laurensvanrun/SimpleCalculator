# SimpleCalculator
## Introduction
This is a simple calculator example used in the Barnsten webinar on November 3th 2021. It shows a simple example of using inversion of control (dependency injection), manually or using Spring4D.
## Using Spring4D
By default the program does not use Spring4D. You can easily enable it by defining the conditional `USE_SPRING4D`.
## Running CodeCoverage
The test-project (can be found in `\Test`) already contains a pre-compiled version of the Delphi Code Coverage tool. After compiling the Test-project (you also need Delphi Mocks installed for this), you can simply start `RunWithCoverage.bat` to create test coverage, both HTML and XML (which can be used for SonarQube).
## Necessary external components
You need Delphi Mocks to compile the test-project. Downloaded the latest [source](https://github.com/VSoftTechnologies/Delphi-Mocks) first and add the `source` directory to your search path.
To use Spring4D, use need to download and install the latest [source](https://bitbucket.org/sglienke/spring4d) first and install it using `Build.exe`.
## Code Coverage
This project contains a pre-compiled version of the Delphi Code Coverage tool. You can find the latest version and complete source code [here](https://github.com/DelphiCodeCoverage/DelphiCodeCoverage).