#cyperweb

Try [`http://cyperweb.ng.bluemix.net`](http://cyperweb.ng.bluemix.net) to see what this app looks like.

###Technique stacks use
To name a few but not least:

1. Spring MVC
2. Spring JDBC
3. Spring Cloud
4. Maven
5. Websphere liberty profile 8.5.5
6. MySQL


###How to deploy the app to Bluemix.

You can either install `cloud foundry` plugin from 
Eclipse marketplace, or you can use cloud foundry CLI like this:
```shell
$cf login -a https://api.ng.bluemix.net

$cf create-service mysql 100 mysql-cyper

$cf services

$cf push cyperweb --no-manifest --no-start -p ./cyperweb.war

$cf start cyperweb

```
###Pitfalls
Don't use below maven archetects in Eclipse JEE, they are meant for RAD.

* webapp-jee5-was
* webapp-jee5-liberty

Nevertheless, use maven-archetype-webapp honestly.



