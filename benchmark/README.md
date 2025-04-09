## Benchmarks

This section contains queries suggested by Carlos del Ojo to test the performance of querying the Public Data File (PDF) stored in Parquet format (see `convert` folder) using [DuckDB](https://duckdb.org/). See each file for more details. The results reported there were achieved using a server with 20 CPUs and 250 GB of RAM.

Note that DuckDB transparently parallelizes queries and manages bigger-than-memory data.
