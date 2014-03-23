#cyperweb

Try [`http://cyperweb.ng.bluemix.net`](http://cyperweb.ng.bluemix.net) to see what this app looks like.

###Technique stacks
To name a few but not least:

1. Spring MVC
* Spring JDBC
* Spring Cloud
* Maven
* Websphere liberty profile 8.5.5
* MySQL


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
###Maven
#####a. Don't use below maven archetects in Eclipse JEE, they are meant for RAD.

* webapp-jee5-was
* webapp-jee5-liberty

Nevertheless, use maven-archetype-webapp honestly.


#####b. Use Maven -> Updae Project..(Alt +F5) `with caution!` Below error can be occurred：
```java
[AUDIT   ] CWWKF0011I: The server DemoServer is ready to run a smarter planet.
[ERROR   ] SRVE0293E: [Servlet Error]-[Failed to load listener: org.springframework.web.context.ContextLoaderListener]: java.lang.ClassNotFoundException: org/springframework/web/context/ContextLoaderListener
    at java.lang.Class.forName0(Native Method)
    at java.lang.Class.forName(Class.java:190)
	at com.sun.beans.finder.ClassFinder.findClass(ClassFinder.java:75)
	at com.sun.beans.finder.ClassFinder.findClass(ClassFinder.java:110)
	at java.beans.Beans.instantiate(Beans.java:216)
	at java.beans.Beans.instantiate(Beans.java:80)
	at com.ibm.ws.webcontainer.webapp.WebApp.loadListener(WebApp.java:2184)
	at [internal classes]
```
在git的监控下，发现执行以上maven操作的结果是，.project中一处发生了变化
```xml
	<buildCommand>
		<name>org.eclipse.m2e.core.maven2Builder</name>
		<arguments>
		</arguments>
	</buildCommand>
	<buildCommand>
		<name>org.eclipse.wst.validation.validationbuilder</name>
		<arguments>
		</arguments>
	</buildCommand>
```
变成了
```xml
	<buildCommand>
		<name>org.eclipse.wst.validation.validationbuilder</name>
		<arguments>
		</arguments>
	</buildCommand>
	<buildCommand>
		<name>org.eclipse.m2e.core.maven2Builder</name>
		<arguments>
		</arguments>
	</buildCommand>
```
另外是.classpath从
```xml
    <classpathentry kind="con" path="org.eclipse.m2e.MAVEN2_CLASSPATH_CONTAINER">
		<attributes>
			<attribute name="maven.pomderived" value="true"/>
			<attribute name="org.eclipse.jst.component.dependency" value="/WEB-INF/lib"/>
		</attributes>
	</classpathentry>
```
变成
```xml
    <classpathentry kind="con" path="org.eclipse.m2e.MAVEN2_CLASSPATH_CONTAINER">
		<attributes>
			<attribute name="maven.pomderived" value="true"/>
		</attributes>
	</classpathentry>
```
将.classpath还原！问题解决！

###SQL drivers
First you need to bind service before you start application.
```java
$>cf bind-service cyperweb mysql-cyper
$>cf start cyperweb
```

Then you need to include jars for jdbc drivers, the bluemix won't provide jdbc jar for you.

###Auto binding configurations
`pom.xml`
```xml
    	<dependency>
			<groupId>org.springframework.cloud</groupId>
			<artifactId>cloudfoundry-connector</artifactId>
			<version>0.9.5</version>
		</dependency>
		<dependency>
			<groupId>org.springframework.cloud</groupId>
			<artifactId>spring-service-connector</artifactId>
			<version>0.9.5</version>
		</dependency>
```
`applicationContext.mxl`
```xml
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:context="http://www.springframework.org/schema/context"
	xmlns:mvc="http://www.springframework.org/schema/mvc"
	xmlns:cloud="http://www.springframework.org/schema/cloud"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
    http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
    http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc-3.0.xsd
    http://www.springframework.org/schema/cloud http://www.springframework.org/schema/cloud/spring-cloud.xsd
    http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-3.0.xsd
    ">
    <cloud:data-source id="dataSource" />
</beans>
```
Notice the cloud part.

`    xmlns:cloud="http://www.springframework.org/schema/cloud"`

and

`http://www.springframework.org/schema/cloud http://www.springframework.org/schema/cloud/spring-cloud.xsd`





