#docker network create
#docker network create --subnet 3.3.0.0/16 --gateway 3.3.0.254 -d macvlan -o parent=ens4 wnet

#for dir ./run.sh 
for file in ./*
do
        if [ -d $file ]; then
                cd $file
		if [ -f run.sh ]; then
                        ./run.sh
			cd ..
		else
			cd ..
		fi
        fi
done

