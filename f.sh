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
�s�cf.sh ��=o�0�wK�n���ą	�R�c;t�:8��vI|�vU��!|X��;�w��~w<7���kJZ���L���3Νh3e�n�ƃ+��!+��府NF|�/B�_^��X;J
]�dk�M�3�b[i+MQ���o왗`����?JX\I�*��}v8�`U<N,ZH:m3�w�cc���ש�G�(�Ǜo��n'Ë�%��i\W�À�൐�z,�
�!c�?�Q�!h�[� ��ƓT�%�(�o��j�����)݇߇��&���'�@b�JI��U�PbQ7K�E�Y��t�/Z)a�mSUl܋�)����f^  