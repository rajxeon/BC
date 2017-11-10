cd ~;
cd fabric-tools;
./stopFabric.sh;
./teardownFabric.sh;
./startFabric.sh;
./createComposerProfile.sh;

cd ../perishable-network;

composer archive create  --sourceType dir --sourceName . -a ./dist/perishable-network.bna;
cd dist;
composer network deploy -a perishable-network.bna -p hlfv1 -i PeerAdmin -s randomString;
cd ..;
composer-rest-server -p hlfv1 -n perishable-network -i PeerAdmin -s randomString -N never -w true
