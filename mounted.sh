#!/bin/bash

cat /proc/mounts |  awk '{ 
   if ( $1 ~ /\/dev/ ) 
   {
      num_elem = split($2,str_array,"/")
      if (str_array[num_elem] == "")
      {
         str_array[num_elem] = "/";
      }
      printf " ${color grey}%5.5s:$color $alignr ${fs_used %s} / ${fs_free %s} / ${fs_size %s}\n  ${fs_bar 7,288 %s} $alignr${fs_used_perc %s}% \n", str_array[num_elem], $2, $2, $2, $2, $2
   }
}'

