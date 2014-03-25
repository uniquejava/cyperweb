<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html lang="en"><head>
    <meta charset="UTF-8">
    <title></title>
<style id="system" type="text/css">*{margin:0;padding:0;}body {	font:13.34px helvetica,arial,freesans,clean,sans-serif;	color:black;	line-height:1.4em;	background-color: #F8F8F8;	padding: 0.7em;}p {	margin:1em 0;	line-height:1.5em;}table {	font-size:inherit;	font:100%;	margin:1em;}table th{border-bottom:1px solid #bbb;padding:.2em 1em;}table td{border-bottom:1px solid #ddd;padding:.2em 1em;}input[type=text],input[type=password],input[type=image],textarea{font:99% helvetica,arial,freesans,sans-serif;}select,option{padding:0 .25em;}optgroup{margin-top:.5em;}pre,code{font:12px Monaco,"Courier New","DejaVu Sans Mono","Bitstream Vera Sans Mono",monospace;}pre {	margin:1em 0;	font-size:12px;	background-color:#eee;	border:1px solid #ddd;	padding:5px;	line-height:1.5em;	color:#444;	overflow:auto;	-webkit-box-shadow:rgba(0,0,0,0.07) 0 1px 2px inset;	-webkit-border-radius:3px;	-moz-border-radius:3px;border-radius:3px;}pre code {	padding:0;	font-size:12px;	background-color:#eee;	border:none;}code {	font-size:12px;	background-color:#f8f8ff;	color:#444;	padding:0 .2em;	border:1px solid #dedede;}img{border:0;max-width:100%;}abbr{border-bottom:none;}a{color:#4183c4;text-decoration:none;}a:hover{text-decoration:underline;}a code,a:link code,a:visited code{color:#4183c4;}h2,h3{margin:1em 0;}h1,h2,h3,h4,h5,h6{border:0;}h1{font-size:170%;border-top:4px solid #aaa;padding-top:.5em;margin-top:1.5em;}h1:first-child{margin-top:0;padding-top:.25em;border-top:none;}h2{font-size:150%;margin-top:1.5em;border-top:4px solid #e0e0e0;padding-top:.5em;}h3{margin-top:1em;}hr{border:1px solid #ddd;}ul{margin:1em 0 1em 2em;}ol{margin:1em 0 1em 2em;}ul li,ol li{margin-top:.5em;margin-bottom:.5em;}ul ul,ul ol,ol ol,ol ul{margin-top:0;margin-bottom:0;}blockquote{margin:1em 0;border-left:5px solid #ddd;padding-left:.6em;color:#555;}dt{font-weight:bold;margin-left:1em;}dd{margin-left:2em;margin-bottom:1em;}@media screen and (min-width: 768px) {    body {        width: 748px;        margin:10px auto;    }}</style><style id="custom" type="text/css"></style></head>
<body><h1>cyperweb</h1>
<p>Try <a href="http://cyperweb.ng.bluemix.net"><code>http://cyperweb.ng.bluemix.net</code></a> to see what this app looks like,
you can fork this project <a href="https://github.com/uniquejava/cyperweb"><code>@github</code></a>
or <a href="http://git.oschina.net/uniquejava/cyperweb"><code>@oschina</code></a>.
</p>
<h3>Technique stacks</h3>
<p>To name but a few:

</p>
<ol>
<li>Spring MVC</li>
<li>Spring JDBC</li>
<li>Spring Cloud</li>
<li>Maven</li>
<li>Websphere Liberty Profile 8.5.5 or Tomcat 7</li>
<li>MySQL</li>
</ol>
<h3>How to deploy the app to Bluemix.</h3>
<p>You can either install <code>cloud foundry</code> plugin from 
Eclipse marketplace, or you can use cloud foundry CLI like this:
</p>
<pre><code class="lang-shell">$cf login -a https://api.ng.bluemix.net
API endpoint: https://api.ng.bluemix.net

Username&gt; your username
Password&gt; your password

$cf create-service mysql 100 mysql-cyper

$cf services

$cf bind-service cyperweb mysql-cyper

$cf push cyperweb --no-manifest --no-start -p ./cyperweb.war

$cf start cyperweb</code></pre>
<h3>Maven</h3>
<p>You can use below command to generate a war package for bluemix.
</p>
<pre><code class="lang-shell">mvn clean package</code></pre>
<p>the generated file will be <code>cyperweb.war</code> for this project. Be careful when you are using maven eclipse plug-in.
</p>
<h5>a. Don't use below maven archetects in Eclipse JEE, they are meant for RAD.</h5>
<ul>
<li>webapp-jee5-was</li>
<li>webapp-jee5-liberty</li>
</ul>
<p>Nevertheless, use maven-archetype-webapp honestly.


</p>
<h5>b. Use Maven -&gt; Update Project..(Alt +F5) <code>with caution!</code> Below error can be occurred：</h5>
<pre><code class="lang-java">[AUDIT   ] CWWKF0011I: The server DemoServer is ready to run a smarter planet.
[ERROR   ] SRVE0293E: [Servlet Error]-[Failed to load listener: org.springframework.web.context.ContextLoaderListener]: java.lang.ClassNotFoundException: org/springframework/web/context/ContextLoaderListener
    at java.lang.Class.forName0(Native Method)
    at java.lang.Class.forName(Class.java:190)
    at com.sun.beans.finder.ClassFinder.findClass(ClassFinder.java:75)
    at com.sun.beans.finder.ClassFinder.findClass(ClassFinder.java:110)
    at java.beans.Beans.instantiate(Beans.java:216)
    at java.beans.Beans.instantiate(Beans.java:80)
    at com.ibm.ws.webcontainer.webapp.WebApp.loadListener(WebApp.java:2184)
    at [internal classes]</code></pre>
<p>with the help of git，the above Maven-&gt;Update Project will cause <code>.project</code> change from
</p>
<pre><code class="lang-xml">    &lt;buildCommand&gt;
        &lt;name&gt;org.eclipse.m2e.core.maven2Builder&lt;/name&gt;
        &lt;arguments&gt;
        &lt;/arguments&gt;
    &lt;/buildCommand&gt;
    &lt;buildCommand&gt;
        &lt;name&gt;org.eclipse.wst.validation.validationbuilder&lt;/name&gt;
        &lt;arguments&gt;
        &lt;/arguments&gt;
    &lt;/buildCommand&gt;</code></pre>
<p>to
</p>
<pre><code class="lang-xml">    &lt;buildCommand&gt;
        &lt;name&gt;org.eclipse.wst.validation.validationbuilder&lt;/name&gt;
        &lt;arguments&gt;
        &lt;/arguments&gt;
    &lt;/buildCommand&gt;
    &lt;buildCommand&gt;
        &lt;name&gt;org.eclipse.m2e.core.maven2Builder&lt;/name&gt;
        &lt;arguments&gt;
        &lt;/arguments&gt;
    &lt;/buildCommand&gt;</code></pre>
<p>and will change <code>.classpath</code> from 
</p>
<pre><code class="lang-xml">    &lt;classpathentry kind="con" path="org.eclipse.m2e.MAVEN2_CLASSPATH_CONTAINER"&gt;
        &lt;attributes&gt;
            &lt;attribute name="maven.pomderived" value="true"/&gt;
            &lt;attribute name="org.eclipse.jst.component.dependency" value="/WEB-INF/lib"/&gt;
        &lt;/attributes&gt;
    &lt;/classpathentry&gt;</code></pre>
<p>to 
</p>
<pre><code class="lang-xml">    &lt;classpathentry kind="con" path="org.eclipse.m2e.MAVEN2_CLASSPATH_CONTAINER"&gt;
        &lt;attributes&gt;
            &lt;attribute name="maven.pomderived" value="true"/&gt;
        &lt;/attributes&gt;
    &lt;/classpathentry&gt;</code></pre>
<p>After I revert the changes in .classpath, the issue is resolved.


</p>
<h3>Auto rebind configurations</h3>
<p>You don't need to do anything if you are using spring framework and
you already have below piece of configuration done there.
</p>
<pre><code class="lang-xml">    &lt;bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource"
        destroy-method="close"&gt;
        &lt;property name="driverClassName" value="${jdbc.driverClassName}" /&gt;
        &lt;property name="url" value="${jdbc.url}" /&gt;
        &lt;property name="username" value="${jdbc.username}" /&gt;
        &lt;property name="password" value="${jdbc.password}" /&gt;
    &lt;/bean&gt;</code></pre>
<p>Because spring framework has a built-in support for cloud and is smart enough to auto 
re-configure your file, it will automatically bind the environment service to this dataSource
and will ignore any your configurations here given that you only have one RDBMS service bind to
your application.

</p>
<p>However, if you want more fine control over your application, you can do below things.

</p>
<p> <code>pom.xml</code> for maven.
</p>
<pre><code class="lang-xml">        &lt;dependency&gt;
            &lt;groupId&gt;org.springframework.cloud&lt;/groupId&gt;
            &lt;artifactId&gt;cloudfoundry-connector&lt;/artifactId&gt;
            &lt;version&gt;0.9.5&lt;/version&gt;
        &lt;/dependency&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;org.springframework.cloud&lt;/groupId&gt;
            &lt;artifactId&gt;spring-service-connector&lt;/artifactId&gt;
            &lt;version&gt;0.9.5&lt;/version&gt;
        &lt;/dependency&gt;</code></pre>
<p><code>applicationContext.mxl</code> for spring framework.
</p>
<pre><code class="lang-xml">&lt;beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:context="http://www.springframework.org/schema/context"
    xmlns:mvc="http://www.springframework.org/schema/mvc"
    xmlns:cloud="http://www.springframework.org/schema/cloud"
    xsi:schemaLocation="http://www.springframework.org/schema/beans
    http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
    http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc-3.0.xsd
    http://www.springframework.org/schema/cloud http://www.springframework.org/schema/cloud/spring-cloud.xsd
    http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-3.0.xsd
    "&gt;
    &lt;cloud:data-source id="dataSource" service-name="mysql-cyper" /&gt;
&lt;/beans&gt;</code></pre>
<p>Notice the new cloud declaration, 
<em>xmlns:cloud="<a href="http://www.springframework.org/schema/cloud">http://www.springframework.org/schema/cloud</a>"</em>

</p>
<p>and
<em><a href="http://www.springframework.org/schema/cloud">http://www.springframework.org/schema/cloud</a> <a href="http://www.springframework.org/schema/cloud/spring-cloud.xsd">http://www.springframework.org/schema/cloud/spring-cloud.xsd</a></em>

</p>
<p>BTW, again, <code>service-name</code> is optional if there is only one RDBMS service bind to this app.

</p>
<h3>Odds and ends</h3>
<ol>
<li>You need to bind mysql service before you start application for the first time.</li>
<li>You must include jars for jdbc drivers, the bluemix won't provide jdbc drivers for you.</li>
</ol>
<p>Edit By <a href="http://mahua.jser.me">MaHua</a></p>
</body></html>