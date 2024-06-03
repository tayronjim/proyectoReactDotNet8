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

ps 40377;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 40377 > /dev/null;
done;

for child in $(list_child_processes 40378);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/tayronijimenez/CS/proyectoReact1/bin/Debug/net8.0/fb270f6dac2646e1897e3ebf4d6ff873.sh;
