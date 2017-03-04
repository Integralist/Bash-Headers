# Bash Headers

A CLI HTTP Headers Filtering Tool (written in Bash)

## Install

Either source this script within your `.bashrc` or copy/paste it directly

## Usage

Set endpoint and filter out specific HTTP response headers:

```bash
$ headers http://www.integralist.co.uk/ 'x-cache|x-timer'

HTTP/1.1 200 OK

X-Cache-Hits: 1
X-Cache: HIT
X-Timer: S1488622963.657342,VS0,VE0
```

Set endpoint but default to showing all the available HTTP response headers:

```bash
$ headers http://www.integralist.co.uk/

HTTP/1.1 200 OK

Access-Control-Allow-Origin: *
Age: 9
Cache-Control: max-age=600
Connection: keep-alive
Content-Length: 8165
Content-Type: text/html; charset=utf-8
Date: Sat, 04 Mar 2017 10:21:37 GMT
Expires: Sat, 04 Mar 2017 10:31:28 GMT
Fastly-Debug-Digest: 8e24d54087128488953c21c63c67485d543224e740f857d4e799563fb18db6fa
Fastly-Debug-Path: (D cache-lcy1120-LCY 1488622897) (F cache-lcy1137-LCY 1488622888)
Fastly-Debug-TTL: (H cache-lcy1120-LCY - - 9)
HTTP/1.1 200 OK
Last-Modified: Fri, 03 Mar 2017 08:33:36 GMT
Server: GitHub.com
Surrogate-Key: www_integralist_co_uk
Vary: Accept-Encoding
Via: 1.1 varnish
X-Cache-Hits: 1
X-Cache: HIT
X-Fastly-Request-ID: f44a92925b0203579bb51431f431ad056177a6d8
X-GitHub-Request-Id: 6564:04D4:2D3D0E:3D7C1C:58BA9525
X-Served-By: cache-lcy1120-LCY
X-Timer: S1488622897.811340,VS0,VE0
```

No parameters will display general usage examples:

```bash
$ headers

        Examples:
                headers https://www.buzzfeed.com/?country=us 'x-cache|x-timer|device' '-H User-Agent:iphone'
                headers https://www.buzzfeed.com/?country=us '' '-H User-Agent:iphone -H X-Foo:bar'

        Help:   headers -h
                headers -help
```

Help flag (`-h` or `-help`):

```bash
$ headers -h

        1st param: URL
        2nd param: regex
        3rd param: http request header

        if you have no need for a regex
        but need a http header
        then just use an empty string ''
```
