#!/bin/bash
#' 
#' Converts the Public Data File to DuckDB format
#' 
#' - The `union_by_name=true` argument is important, because diferent input
#'   lines contain different fields.
#' 

DBSRC="202503-PDF"
DBDST="$DBSRC.db"

duckdb $DBDST " \
  CREATE TABLE pdf AS \
  SELECT * FROM read_ndjson('$DBSRC/*.jsonl.gz', union_by_name=true)"
