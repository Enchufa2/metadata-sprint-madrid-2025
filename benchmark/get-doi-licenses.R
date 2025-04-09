#' Get DOIs for all books with at least two licenses
#' 
#' - It is reported to take ~30 min using Spark
#' - This queries a Hive-partitioned Parquet version of the PDF using DuckDB,
#'   and takes ~10 min
#' 
library(dplyr)

conn <- DBI::dbConnect(duckdb::duckdb()) # works in memory by default
dblc <- "202503-PDF.hive.parquet/*/*/*.parquet"
DBI::dbSendQuery(conn, paste0("CREATE VIEW pdf AS SELECT * FROM '", dblc, "'"))

bench::system_time({
  types <- c("book", "book-section", "report-component", "book-part", "book-chapter")
  x <- tbl(conn, "pdf") |> 
    filter(type %in% types) |> 
    filter(length(license) > 1L) |> 
    pull(DOI)
})
length(x) # ~3.5 million
