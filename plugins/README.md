# java-dev-kit

A Claude Code plugin for Java developers. It scaffolds Spring Boot endpoints, writes JUnit 5 tests, decodes stack traces, reviews code, and auto-formats Java on save.

## What's inside

| Component | Type | What it does |
| :-- | :-- | :-- |
| `/java-dev-kit:spring-endpoint` | Skill | Scaffolds a Spring Boot 3 controller + service + DTO from a description |
| `/java-dev-kit:junit-test` | Skill | Generates JUnit 5 + Mockito tests for a class |
| `/java-dev-kit:explain-stacktrace` | Skill | Finds the root cause of an exception and proposes a fix |
| `java-reviewer` | Agent | Reviews Java for correctness, concurrency, and resource safety |
| Format-on-save | Hook | Runs Spotless / google-java-format after every Java write or edit |
| Java LSP | `.lsp.json` | Real-time code intelligence via `jdtls` |

## Try it locally

```bash
claude --plugin-dir ./java-dev-kit
```

Then, inside a Spring Boot project:

```
/java-dev-kit:spring-endpoint a Product resource with name, price, and stock count
/java-dev-kit:junit-test ProductService
/java-dev-kit:explain-stacktrace <paste your exception here>
```

Ask Claude to "review my Java changes" to invoke the `java-reviewer` agent.

## Requirements (optional, for full functionality)

- **Format-on-save**: a Spotless target in your `pom.xml`/`build.gradle`, or `google-java-format` on your `PATH`. Without either, the hook is a no-op.
- **LSP**: `jdtls` (Eclipse JDT Language Server) on your `PATH`.

Nothing is required to try the skills and agent — those work out of the box.

## Reloading during development

After editing plugin files, run `/reload-plugins` in Claude Code to pick up changes without restarting.
