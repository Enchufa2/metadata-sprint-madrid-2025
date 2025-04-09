#!/bin/bash
#' 
#' Get cited-by data, i.e., get the number of documents citing each DOI
#' 
#' - It is reported to take ~30 min using Spark
#' - This queries a Hive-partitioned Parquet version of the PDF using DuckDB, and
#'   takes about the same time, including writing the result into a Parquet file
#' 

DBLC='202503-PDF.hive.parquet/*/*/*.parquet'

time duckdb :memory: " \
  copy ( \
    select DOI, count(*) as 'cited-by' \
    from (select unnest(reference).DOI as DOI from '$DBLC') \
    group by DOI \
  ) to 'cited-by.parquet' ( \
    format parquet, compression zstd \
  )"
