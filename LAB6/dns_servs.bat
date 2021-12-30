net start > servs_before
net stop TermService
timeout 1
net start > servs_after
fc servs_before servs_after > diff
net start TermService