#
#split large file into smaller ones but keeping the first line (CSV header) on all the files
#
awk -v l=11000 '(NR==1){header=$0;next}
                (NR%l==2) {
                   close(file); 
                   file=sprintf("%s.%0.5d.csv",FILENAME,++c)
                   sub(/csv[.]/,"",file)
                   print header > file
                }
                {print > file}' file.csv
                


