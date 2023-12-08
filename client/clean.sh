#for dir ./clean.sh 
for file in ./*
do
        if [ -d $file ]; then
                if [ -f $file/clean.sh ]; then
                        ./$file/clean.sh
                fi
        fi
done
