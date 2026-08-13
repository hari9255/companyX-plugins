---
description: Generate JUnit 5 + Mockito unit tests for a Java class. Use when the user asks to write tests, add unit tests, increase coverage, or test a specific class or method in a Java project.
---

# Generate JUnit 5 tests

Target to test: "$ARGUMENTS" (a class name, file path, or method).

Steps:
1. Locate and read the target class under `src/main/java`. Identify its public methods, constructor dependencies, and branches (null checks, exceptions, loops, conditionals).
2. Create the test class under `src/test/java` mirroring the source package, named `<ClassName>Test.java`.

Conventions:
- JUnit 5 (`org.junit.jupiter.api.*`), AssertJ (`assertThat`) if the project already uses it, otherwise plain JUnit assertions.
- Mock collaborators with Mockito: `@ExtendWith(MockitoExtension.class)`, `@Mock`, `@InjectMocks`.
- One test method per behavior, named `methodName_condition_expectedResult` (e.g. `findById_whenMissing_throwsNotFound`).
- Follow Arrange–Act–Assert with blank lines separating the three sections.
- Cover the happy path, at least one edge case, and each thrown-exception path (`assertThrows`).
- Use `@DisplayName` for human-readable descriptions.
- Don't test getters/setters or trivial code.

After writing, if a build file is present, tell the user the exact command to run just these tests:
- Maven: `mvn -Dtest=<ClassName>Test test`
- Gradle: `./gradlew test --tests "*<ClassName>Test"`
