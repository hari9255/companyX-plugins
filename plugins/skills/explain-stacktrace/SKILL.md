---
description: Analyze a Java stack trace, identify the root cause, and propose a fix. Use when the user pastes an exception, stack trace, or asks why their Java app is crashing or throwing an error.
---

# Explain a Java stack trace

Stack trace / error: "$ARGUMENTS"

Work through it in this order and present the result as a short, structured answer:

1. **Root cause** — Read the trace bottom-up. The deepest `Caused by:` is usually the real culprit; the top exception is often a wrapper. Name the actual exception type and the single line of *the user's own code* (not framework/JDK frames) where it originates.
2. **What it means** — Explain the exception in one or two plain sentences. Cover the common Java traps precisely:
   - `NullPointerException` — which reference is null and why (helpful NPE messages in Java 14+ name it).
   - `ClassNotFoundException` / `NoClassDefFoundError` — missing/duplicate dependency or version clash.
   - `LazyInitializationException` — Hibernate session closed before access.
   - `BeanCreationException` / `UnsatisfiedDependencyException` — Spring wiring problem; report the bean and missing dependency.
3. **Fix** — Give the concrete change. If you can see the referenced file in the project, read it and propose an exact edit.
4. **Prevent** — One short tip (e.g. `Optional`, defensive null check, `@Transactional` boundary, dependency exclusion).

Keep it tight. Don't restate the whole trace back to the user.
