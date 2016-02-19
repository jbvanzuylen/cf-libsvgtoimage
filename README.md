# cf-libsvgtoimage
Coldfusion wrapper to convert svg images to jpg/png images,with use of Apache Batik library

__A svg to image (jpg or png) converter library for Coldfusion__

Build on top of the [The Apache™ Batik Project](https://xmlgraphics.apache.org/batik/) from Apache

# How to install

### Railo

Download the latest version [here](https://github.com/svantroyen/cf-libsvgtoimage/releases/download/v0.1.0/cf-libsvgtoimage-ext.zip)

__Install as an extension__

* Connect to the Web Administration
* Go to `Extension > Application`
* Scroll down to the bottom of the page
* Click on `Browse` button in the `Upload new extension` section
* Select the ZIP file you have downloaded above
* Hit the `Upload` button and follow the instructions

__Manual installation__

* Unzip the file you have downloaded above
* Copy the `.jar` files from the `lib` folder to the `WEB-INF\railo\library\lib directory` in your web root
* Copy the `.cfm` files from the `functions` folder to the `WEB-INF\railo\library\function` directory in your web root
* Copy the `.cfc` file from the `components` folder to the `WEB-INF\railo\components\libsvgtoimage` directory in your web root
