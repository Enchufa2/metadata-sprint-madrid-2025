## Getting the schema

After converting the Public Data File (PDF) to Parquet format, the schema can be trivially exported from there with any suitable reader. E.g., with R,

```bash
Rscript -e 'arrow::open_dataset("202503-PDF.hive.parquet")' > schema/schema.txt
```

we get the schema in this folder.