---
description: Scaffold a Spring Boot REST endpoint (controller, service, DTO) from a resource description. Use when the user asks to create, add, or scaffold a REST endpoint, controller, or CRUD API in a Spring Boot project.
---

# Scaffold a Spring Boot REST endpoint

The user wants a REST endpoint for: "$ARGUMENTS"

Generate idiomatic Spring Boot 3 (Jakarta, not javax) code. Detect the project's base package from existing sources under `src/main/java`; if none exists, ask once, then default to `com.example`.

Produce these layers, each in its own file under the correct package directory:

1. **Controller** — `@RestController`, `@RequestMapping("/api/<resource>")`, constructor-injected service, standard CRUD methods (`GET /`, `GET /{id}`, `POST`, `PUT /{id}`, `DELETE /{id}`). Return `ResponseEntity<>`; use `@Valid` on request bodies.
2. **Service** — interface + implementation annotated `@Service`. Keep business logic here, not in the controller.
3. **DTO / record** — a Java `record` for the request/response payload with `jakarta.validation` constraints (`@NotNull`, `@NotBlank`, `@Size`) where sensible.
4. **Entity** (only if the description implies persistence) — JPA `@Entity` with `@Id @GeneratedValue`.

Rules:
- Never mix `javax.*` and `jakarta.*`. Spring Boot 3 uses `jakarta.*`.
- Use constructor injection, never `@Autowired` on fields.
- Add a brief Javadoc on each public type.
- After writing files, print the list of created files and the curl command to hit the new `POST` endpoint.
