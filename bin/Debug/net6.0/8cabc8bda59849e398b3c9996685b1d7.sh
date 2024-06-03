function list_child_processes () {
    local ppid=$1;
    local current_children=$(pgrep -P $ppid);
    local local_child;
    if [ $? -eq 0 ];
    then
        for current_child in $current_children
        do
          local_child=$current_child;
          list_child_processes $local_child;
          echo $local_child;
        done;
    else
      return 0;
    fi;
}

ps 39629;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 39629 > /dev/null;
done;

for child in $(list_child_processes 39732);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/tayronijimenez/CS/proyectoReact1/bin/Debug/net6.0/8cabc8bda59849e398b3c9996685b1d7.sh;
