## Converting to other formats

This section contains PoCs of converters to alternative formats for the Public Data File (PDF).

### Parquet

This format has several advantages:

- Columnar format, optimized for analytics.
- Supports different compression methods.
- Supports partitioning.
- Can be read using Arrow, which has many integrations.

In particular, tests in this repo have been done by converting the PDF to a Hive-partitioned Parquet dataset using `type` and `year` of publication as partitioning keys, and DuckDB as the SQL engine to query such dataset.

### DuckDB

[DuckDB](https://duckdb.org/) is a fast analytical SQL database system, with standalone clients in many languages, such as Python or R. It has several extensions that enables using different formats as the backend transparently (e.g. CSV, Parquet, JSON, S3...), but it also has its own database format. This is the format used when working in memory (by default), and can be persisted onto disk. Using this format is recommended for repeated queries, as it is much faster (see [this](https://duckdb.org/docs/stable/guides/performance/file_formats.html)).
