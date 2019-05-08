# Pumpkin Docker Image
Ubuntu based docker image for deploying Pumpkin WordPress starter theme using bitbucket pipeline with git-ftp. Works with FTP and SFTP protocols.
[https://hub.docker.com/r/codesoup/pumpkin](https://hub.docker.com/r/codesoup/pumpkin)


## WordPress Theme
WordPress starter theme Pumpkin:
[https://github.com/code-soup/pumpkin](https://github.com/code-soup/pumpkin)


## Includes
- Ubuntu 18.04
- PHP 7.2
- Composer 1.6.3
- Node 8.10.0
- NPM 3.5.2
- Git-ftp 1.5.2 (with support for SFTP)
- curl 7.64.1


## Pipeline Variables
- `$FTP_HOST`
Server, including protocol, without trailing slash eg: `sftp://my.wordpress-host.com` 

- `$FTP_PORT`
FTP/SFTP port, eg: 2222

- `$FTP_USER`
Your FTP/SFTP username

- `$FTP_PASSWORD`
Your FTP/SFTP password

- `$FTP_PATH`
Path where you want to upload your repository, without trailing slash

## Further Reading

-   Read the Git-ftp [manual](https://github.com/git-ftp/git-ftp/blob/master/man/git-ftp.1.md)  for more options, features and examples.
-   See the  [installation instructions](https://github.com/git-ftp/git-ftp/blob/master/INSTALL.md)  for your system.
-   Check  [git-ftp issues on GitHub](http://github.com/git-ftp/git-ftp/issues)  for open issues.
-   Deploy with  [Git-ftp and Bitbucket Pipelines](https://www.youtube.com/watch?v=8HZhHtZebdw)  (video tutorial).