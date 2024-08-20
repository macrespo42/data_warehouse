#!/usr/bin/bash

function get_dependencies() {
  apt update -y
  apt install curl -y
  apt install unzip -y
}

function get_subject() {
  curl https://cdn.intra.42.fr/document/document/25745/subject.zip -o /opt/subject.zip
  unzip /opt/subject.zip
  mv subject /opt/subject
}

function import_csv_to_db() {
  psql -U macrespo -d piscineds -h localhost -v table="$1" -v tablepath="$2" -f /opt/automatic_table.sql -w
}

function enable_psql_automatic_login() {
  echo "localhost:5432:piscineds:macrespo:mysecretpassword" > ~/.pgpass
  chmod 0600 ~/.pgpass
}

function main() {
  get_dependencies
  get_subject
  enable_psql_automatic_login
  for filepath in $(find /opt/subject/customer -type f -name "*.csv"); do
    filename=$(basename "$filepath" .csv)
    import_csv_to_db "$filename" "$filepath"
  done
  psql -U macrespo -d piscineds -h localhost -f /opt/items_table.sql -w
}

main
