Feature: composer/installers handling

  Scenario: Visit a file in the EDE project
    Given I visit "src/main.php" in project "with-installers"
    Then ede-php-autoload-project should exist

  Scenario: Load a class from the main package
    Given I visit "src/main.php" in project "with-installers"
    Then the class "MainPackage\\MainPackageClass" should be detected in "src/MainPackageClass.php"

  Scenario: Load a package class installed by type
    Given I visit "src/main.php" in project "with-installers"
    Then the class "Package1\\Package1Class" should be detected in "custom/typed-package/src/Package1Class.php"

  Scenario: Load a package class installed by vendor name
    Given I visit "src/main.php" in project "with-installers"
    Then the class "Package2\\Package2Class" should be detected in "custom/vendor2/package2/src/Package2Class.php"

  Scenario: Load a package class installed by package name
    Given I visit "src/main.php" in project "with-installers"
    Then the class "Package3\\Package3Class" should be detected in "other/package3/src/Package3Class.php"

  Scenario: Load a dev package class installed by vendor name
    Given I visit "src/main.php" in project "with-installers"
    Then the class "Package4\\Package4Class" should be detected in "custom/vendor2/package4/src/Package4Class.php"
