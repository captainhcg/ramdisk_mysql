# Setup in memory MySQL test database in Mac OS
---

### Configure mysql config if needed
Edit `mysql_test.cnf` if needed. The default configuration is configured for very small in memory database.

### Setup Database
Run `./setup_in_mem_mysql.sh` to set up in memory database.
It will create a 600M ram drive at which the test database locates. Socket, pid file and  logs will be stored here as well, as configured in `mysql_test.cnf`. 

### Test Connection
```
/usr/local/mysql/bin/mysql \
    -u mysql_test \
    -e "SHOW DATABASES;"
```