
Get the model output
```
rsync -avx shaw7955@slespa01142.srv.sydney.edu.au:/srv/zissou/output/theoretical/ Documents/Thesis/chapters/theoretical/data/model-output/
```

Copy the executable to the server
```{}
scp Development/zissou/target/scala-2.12/zissou.jar shaw7955@slespa01142.srv.sydney.edu.au:/usr/local/bin/zissou/
```

Connect to the linux server
```
ssh shaw7955@slespa01142.srv.sydney.edu.au
```

Logs are located
```
/var/log/zissou.log
```

Input / Output are located
```
/srv/zissou
```
