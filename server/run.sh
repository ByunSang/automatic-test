#docker network create
#docker network create --subnet 4.4.0.0/16 --gateway 4.4.0.254 -d macvlan -o parent=ens4 wnet

#for dir ./run.sh 
for file in ./*
do
	if [ -d $file ]; then
		cd ./$file
		pwd
		if [ -f ./run.sh ]; then
			./run.sh
			cd ../
		else 
			cd ../
		fi 
	fi
done

