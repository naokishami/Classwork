echo "This backup assumes there is  no password and user is root"
FILE="sqldump.sql"
if test -e "$FILE"; then
echo "true"
mysqldump -h localhost -u root -c --add-drop-table docoffice > sqldump.sql
else
echo "false"
rm sqldump.sql
mysqldump -h localhost -u root -c --add-drop-table docoffice > sqldump.sql
fi