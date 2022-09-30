#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��+cf.sh �RMs� ��+(�饑���V2I.g&���c�+��@���{�����i���{<�7��my!|M����uKù�ҡn�փ�hؐJlx�)��)şB�-oD��8"����1�Ч�A��h�)��]�~�����x�dGh\�`�nhxOX��Yf�;��}���V�X}>b��{�������.�Kt!��,���%._5���!m+?�|�J�㠆�N��l����Ty1�U�L�J%?f���:Of�l:��f�����0�cG��m�����Ɣ��0�h=����J�]��LKa< ���<�wP��k��g��>zȰ�����@a��|dO�	�X�KjQM��i�[��h��V+n[c��I���e�6�<  