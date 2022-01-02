# rasp-seedbox
Various scripts and setups for my raspberry pi seedbox.

## prelude

This is a mish and mash of various scripts and a docker compose file containing all the scripts I am running in my raspberry pi raspbian server edition which resides in my local home network.

It includes:
- NordVPN VPN gateway.
- Deluge Torrent Client.
- Sonarr TV Series Manager.
- NTFS3G for mounting NTFS system disks.
- SAMBA service for exposing the disks to Windows network computers.
- MiniDLNA server for serving all the media in the Network.
- Subtitler service based on [Subliminal's Image](https://hub.docker.com/r/dtroncy/rpi-subliminal)



## installation

You must run first the `./install.sh rasp-seedbox`.

After the installation is complete you must run the `./setup_drive.sh`. That is run as following:

```
$ sudo ./setup_drive.sh /path/to/my/media/disk LABEL_OF_MY_MEDIA_DISK
```
Then you have to reboot the machine.
## usage

Just run this:

```
$ docker-compose -f rasp-seedbox/docker-compose.yml up -d
```

You can alsow browse the logs, and see if everything is in order.

Web exposable services are:

- Deluge is exposed at http://rasp-seedbox.local:8112
- Sonarr is exposed at http://rasp-seedbox.local:8989


The config folder holds all the data that are needed to save when running both deluge and sonarr, which is quite handy in case your raspberry disk gets corrupted (which happens quite often).

## bonus subtitle command

This command allows you to download subtitles for all the files that are in the folder you are running it from, but it requires an account in opensubtitles.org

```
docker run --rm --name subliminal -v subliminal_cache:/usr/src/cache -v /path/to/my/media/disk:/tvshows -it dtroncy/rpi-subliminal --opensubtitles openuser openpass download -l en -s /tvshows/folder_with_a_tv_series
```
