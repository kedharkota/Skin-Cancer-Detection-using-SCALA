# Reproducibility and visual sources

## Scope

This guide describes what is available in the committed project and what is required to reproduce it. The documentation update inspected source and saved outputs; it did not rerun model training or hardware/simulation experiments.

## Required inputs

The technology summary explicitly describes a Random Forest trained on synthetic examples, rather than a validated medical model. Application source, training data, and real medical checkpoints are absent. The notes contain inconsistent Java-version assumptions that need resolution against a tested environment.

## Entry point

Start by reviewing `build.sbt` and the technology summary. A runnable checkout also needs the missing Play controllers/views, routes, resources, and sbt plugin metadata, including the `PlayScala` plugin definition.

After those source files are restored, use a compatible JDK/sbt installation and reconcile the Java-module flags in the launch configuration before attempting the documented start scripts. A clean checkout cannot currently be built as the full application.

## Evidence and interpretation

The repository supports an architectural description and dependency inventory, not an independently runnable or clinically evaluated classifier. The workflow image represents the design described in the committed notes. No application screenshot or diagnostic accuracy is claimed.

## Visual provenance

All screenshots and experiment figures are tied to repository material. Workflow SVGs are explanatory illustrations. The full image inventory is in [assets/sources.json](assets/sources.json).

| Visual | Source |
| --- | --- |
| [overview.svg](assets/overview.svg) | New explanatory project-workflow diagram based on the committed source and documentation; not a screenshot or measured result. |

## Validation

```bash
python tools/check_docs.py
```

The standard-library checker validates README/docs local link destinations and SVG/PNG/JPEG headers. It makes no external requests and installs no project runtime dependencies. External web links, model accuracy, image semantics, and full application execution need separate review.

## Reproduction record

For a new experiment or demo, record the source commit, environment versions, data provenance and split, configuration, command/notebook order, and resulting artifacts. Only label a measurement as reproduced after completing that run. Keep credentials and restricted datasets outside version control.
