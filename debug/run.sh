R -d "valgrind --dsymutil=yes --tool=memcheck \
      --leak-check=full --track-origins=yes \
      --log-file=./${1}.log" \
      --vanilla < ${1}

echo -e '\n\n\n' >> ${1}.log
echo `date` >> ${1}.log
