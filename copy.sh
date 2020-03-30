cd /root/
if [ -f copy.txt ]
then
rm -rf copy.txt
fi
ls -la
#chmod 756 anchore.sh
./test2.sh
