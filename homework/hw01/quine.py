# another solution
# s = "print('s = ' + repr(s) + '; eval(s)')"; eval(s)
s = 's = %r; print(s %% s)'; print(s % s)