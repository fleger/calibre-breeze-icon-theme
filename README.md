# Breeze icon theme for Calibre 

[Calibre](https://calibre-ebook.com) icon theme based on the [Breeze icon set](https://cgit.kde.org/breeze-icons.git/).

## Building the icon theme

In order to build the icon theme you'll need to install:
* [Calibre](https://calibre-ebook.com)
* [Breeze Icons](https://download.kde.org/stable/frameworks/)
* [librsvg](https://wiki.gnome.org/Projects/LibRsvg)
* [OptiPNG](http://optipng.sourceforge.net)

Then run the ```build.sh``` script:
```
./build.sh
```

The script assumes that Calibre is installed in ```/usr/share/calibre``` and that the Breeze icon set is installed in ```/usr/share/icons/breeze```.
If this is not the case, you can invoke ```build.sh``` with the following environment variables:
```
CALIBRE_RESOURCES_PATH="/path/to/calibre" BREEZE_ICONS_PATH="/path/to/breeze/icons" ./build.sh
```

The script will generate a directory called resources that will contain the Calibre icon theme.

You can then use the generated icon set with Calibre by executing the following commands:
```
install -dm755 ~/.config/calibre
ln -sf "$PWD/resources" ~/.config/calibre/
```

## Screenshots

![Calibre](https://raw.githubusercontent.com/fleger/calibre-breeze-icon-theme/screenshots/calibre.png)

![eBook Viewer](https://raw.githubusercontent.com/fleger/calibre-breeze-icon-theme/screenshots/viewer.png)

![eBook Editor](https://raw.githubusercontent.com/fleger/calibre-breeze-icon-theme/screenshots/editor.png)
