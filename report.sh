#!/bin/sh
DATE=`date --iso-8601=seconds`

# LTSVなログ前提
LOG_BASE=/home/isucon/tmp

# stat url
URL_STAT=`cat $LOG_BASE/access.log | perl -F"\t" -anle '{($key = $F[3]) =~ s/(req:|HTTP\/1\.1)//g;$key =~ s/[0-9]//g;$key =~ s/ //g;$key =~ s/\//\//g;$c{$key}++;$t{$key}+=substr($F[8],6,5)}END{for(keys %t){print int($t{$_})." ".int($t{$_}/$c{$_}*1000)." ".$c{$_}. " $_";}}' | sort -nr`
echo "sum sec	ave msec	count	URL"
echo "$URL_STAT" | while read timesum timeave count url; do
    echo "$timesum	$timeave	$count	$url"
done

echo

# count status
STATUS_COUNT=`cat $LOG_BASE/access.log | grep -E '^host' | awk -F '\t' '{gsub(/status:/, "", $5);print $5}' | sort | uniq -c`
echo "count	status code"
echo "$STATUS_COUNT" | while read num status; do
    echo $num	$status
done

# end
# mv $LOG_BASE/access.log $LOG_BASE/access.log.`date +'%Y%m%d-%H%M%S'`
# touch $LOG_BASE/access.log

sudo supervisorctl restart nginx
