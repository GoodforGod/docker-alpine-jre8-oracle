# Docker Alpine Oracle JRE 8
Docker Alpine image with cleaned Oracle JRE 8 Update 172 (size 120MB)

## Licence
You must accept the [Oracle Binary Code License Agreement for Java SE](http://www.oracle.com/technetwork/java/javase/terms/license/index.html) to use this image.

## Image
Image uses [frol](https://github.com/frol/docker-alpine-glibc) Alpine image with glibc as a base image.

And contains cleaned [Oracle JRE 1.8.172](http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html) version without *desktop, sources* and other unnecessary stuff except JVM. So image have all *JVM* parts to run *Java applications* in Docker containers.

Image contains only Java Runtime Environment, so you must have compiled Java application.

## Usage
Image have docker *USER* named **app** so you can use it for your application.

Check [example](https://github.com/GoodforGod/docker-alpine-jre8-oracle/tree/master/example) folder for *Dockerfile* example of using image.


