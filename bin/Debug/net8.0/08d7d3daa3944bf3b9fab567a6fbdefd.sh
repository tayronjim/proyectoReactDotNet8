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

ps 33907;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 33907 > /dev/null;
done;

for child in $(list_child_processes 33908);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/tayronijimenez/CS/proyectoReact1/bin/Debug/net8.0/08d7d3daa3944bf3b9fab567a6fbdefd.sh;
