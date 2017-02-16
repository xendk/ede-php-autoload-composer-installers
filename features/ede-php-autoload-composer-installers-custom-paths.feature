Feature: Configuration of paths

  Scenario: Unknown package types should trigger a warning
    When I visit "src/main.php" in project "custom-paths"
    Then I should see a "Unknown package type 'typed-package'" warning
    And I should see a "Unknown package type 'typed-package2'" warning

@this
  Scenario: Configured types should be installed at the configured path
    Given I have configured the project types:
      | type           | path          |
      | typed-package  | path1/{$name} |
      | typed-package2 | path2/{$name} |
      # Use another copy to avoid ede's cache.
    When I visit "src/main.php" in project "custom-paths"
    Then the class "Package1\\Package1Class" should be detected in "path1/package1/src/Package1Class.php"
    And the class "Package2\\Package2Class" should be detected in "path2/package2/src/Package2Class.php"
    # This type is not configured, but installed in the default
    # composer path, so it should also be found.
    And the class "Package3\\Package3Class" should be detected in "vendor/vendor3/package3/src/Package3Class.php"
