cat /var/log/anaconda/X.log | grep -E '^\[.*\] \(II\) .*' | sed 's/(II)/Information: /'
cat /var/log/anaconda/X.log | grep -E '^\[.*\] \(II\) .*' | sed 's/(WW)/Warning: /'
