## ShadowsocksR Single User
### Install Libs

#### CentOS
```
    yum install python-setuptools && easy_install pip
    yum install git
```

#### ubuntu/debian
```
    apt-get install python-pip
    apt-get install git
```

### Get Source Code
> git clone -b master https://github.com/misselvexu/shadowsocksr-py.git

### Server Config
```
cd ~/shadowsocksr
bash initcfg.sh
cd ~/shadowsocksr/shadowsocks

```

### Quick Demo :
>```
> python server.py -p 443 -k password -m aes-256-cfb -O auth_sha1_v4 -o http_simple
>```
> Info：-p port -k password  -m c-method -O p-plugin -o obfs-plugin

> Background Start
```
python server.py -p 443 -k password -m aes-256-cfb -O auth_sha1_v4 -o http_simple -d start
```

> Start And Stop
```
    python server.py -d stop/restart
```

> Check Log
```
    tail -f /var/log/shadowsocksr.log
```

### Run With Config
> vim `user-config.json`

> Shell Commands
```
    # start
    python server.py -d start
    
    # stop or restart
    python server.py -d stop/restart
    
    # check log
    tail -f /var/log/shadowsocksr.log
```






## ShadowsocksR Multi-Users
### Install Libs

#### centos
```
    yum install python-setuptools && easy_install pip
    yum install git
```

#### ubuntu/debian
```
    apt-get install python-pip
    apt-get install git
```

### Get Source Code
> git clone -b master https://github.com/misselvexu/shadowsocksr-py.git

### Server Config

> Ready to config：
>```
>    cd ~/shadowsocksr
>    bash initcfg.sh
>```

- Multi-Users With JSON

> 1.Edit file `userapiconfig.py`：
>```
>    API_INTERFACE = 'mudbjson' #api type
>    SERVER_PUB_ADDR = '127.0.0.1' # target ip host
>```

- Multi-Users With MYSQL

> 1.Install MYSQL Python lib
>```
>    ./setup_cymysql.sh
>```
> 2.Edit file `userapiconfig.py`
>```
>    API_INTERFACE = 'sspanelv2' //
>```
> Tips :Depending on the type of your database, you need to choose the correct one : sspanelv2, sspanelv3, sspanelv3ssr, glzjinmod, legendsockssr

> 3.Edit file `usermysql.json`

```json
    {
        "host": "127.0.0.1", //database host
        "port": 3306, //
        "user": "ss",
        "password": "pass",
        "db": "shadowsocks", // database name
        "node_id": 1, // node ID（only sspanelv3 support）
        "transfer_mul": 1.0,
        "ssl_enable": 0,
        "ssl_ca": "",
        "ssl_cert": "",
        "ssl_key": ""
    }
```

> 4.Edit file `user-config.json`
```
    "method":"aes-256-cfb",                  //Modify the name of the encryption method
    "protocol": "auth_sha1_v4",              //Modify the name of the protocol plugin
    "obfs": "tls1.2_ticket_auth_compatible", //Change to the name of the confusing plugin
```


> Config Port and corresponding encryption, protocol, obfuscation and other configuration With Command file `mujson_mgr.py` ：
```
    python mujson_mgr.py
```

> Config Demo Command Like :
```
    python mujson_mgr.py -a -u misselvexu -p 11011 -k misselvexupwd -m aes-256-cfb -O auth_aes128_md5 -o tls1.2_ticket_auth
```

### Server Start / Stop / Log

> Background running
>```
> ./run.sh
>```
> Background running With Log
>```
> ./logrun.sh
>```
> Check Log
>```
> ./tail.sh
>```
> Stop Running
>```
> ./stop.sh
>```
> 
> Tips：the default log will be saved in the root directory of `ssserver.log`, you can manually view log file `ssserver.log`

### Upgrade Source Code
```
cd shadowsocksr & git pull
``` 