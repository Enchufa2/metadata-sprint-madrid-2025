#!/bin/bash
#' 
#' Converts the Public Data File to Parquet format
#' 
#' - The `union_by_name=true` argument is important, because diferent input
#'   lines contain different fields.
#' - Data is Hive-partitioned by type of document and year of publication.
#'   Partitioning could be improved or even removed.
#' - Zstandard (zstd) is used as the compression algorithm.
#' 

DBSRC="202503-PDF"
DBDST="$DBSRC.hive.parquet"

duckdb :memory: " \
  COPY ( \
    SELECT *, published.\"date-parts\"[1][1] AS year \
    FROM read_ndjson('$DBSRC/*.jsonl.gz', union_by_name=true) \
  ) TO '$DBDST' (FORMAT parquet, COMPRESSION zstd, PARTITION_BY (type, year))"
