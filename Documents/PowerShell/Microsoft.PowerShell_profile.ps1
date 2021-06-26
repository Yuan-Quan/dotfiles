# region profile alias initialize
Import-Module -Name HackF5.ProfileAlias -Force -Global -ErrorAction SilentlyContinue
# end region

#Set proxy
set http_proxy=http://127.0.0.1:7890/
set https_proxy=$http_proxy
set ftp_proxy=$http_proxy
set socks_proxy=socks5://127.0.0.1:7890/
set rsync_proxy=$http_proxy
set no_proxy="localhost,127.0.0.1,localaddress,.localdomian.com"
set HTTP_PROXY=$http_proxy
set HTTPS_PROXY=$https_proxy
set FTP_PROXY=$ftp_proxy
set SOCKS_PROXY=$socks_proxy
set RSYNC_PROXY=$rsync_proxy
set NO_PROXY=$no_proxy
