#!/bin/bash
#SOURCE_DIR=/media/filingcabinet/Unsorted/
SOURCE_DIR=/media/filingcabinet/Unsorted/*.pdf
SOURCE_FILES=$SOURCE_DIR/*.pdf
#OUTPUT_DIR=/media/filingcabinet/Intray/
OUTPUT_DIR=/filingcabinet/Intray/

shopt -s nullglob  #This is required otherwise it will resolve *.pdf to "*.pdf" when no files.

for f in $SOURCE_FILES;
  do

### TO DO LIST
## Start using inotify-tools and have this script run as a daemon.

#Setup output filenames.
  FILENAME=${f##*/}
  OUTPUT_FILE=$OUTPUT_DIR$FILENAME
    if [ -f "$OUTPUT_FILE" ]
    then  #If this file exists, keep adding numbers until it doesn't
      echo "File $OUTPUT_FILE exists!!!!!!!!!!"
      x=1
      while [ -f "$OUTPUT_FILE" ]; do
         OUTPUT_FILE="$OUTPUT_DIR${FILENAME%.pdf}-$x.pdf" #This mess essentially inserts the number
         let x=$x+1
      done
    else 
      echo "File $OUTPUT_FILE does not exist yet"
    fi

# Test whether the PDF is already searchable. If not, run it through ocr, if it is then just move it.

  STRING=$(strings "$f" | grep FontName) 
    if [ -z "$STRING" ]
    then
     echo ""
      #echo "Not a searchable PDF, we need to ocr."
      #/usr/local/rvm/rubies/default/bin/ruby /home/pdfocr.rb -i "$f" -o "$OUTPUT_FILE"
      #rm -rf $f
    else
     echo ""
      #echo "Skip this one, its already searchable."
     #cp $f $OUTPUT_FILE
     #rm -rf $f 
    fi
  done

