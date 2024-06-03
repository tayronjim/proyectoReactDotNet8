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

ps 31921;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 31921 > /dev/null;
done;

for child in $(list_child_processes 31924);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/tayronijimenez/CS/proyectoReact1/bin/Debug/net8.0/d49ce9ea1660453cb104c025a9d3b002.sh;
